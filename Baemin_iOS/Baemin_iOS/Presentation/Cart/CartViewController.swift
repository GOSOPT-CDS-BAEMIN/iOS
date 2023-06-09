//
//  CartViewController.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/19.
//

import UIKit

import SnapKit

class CartViewController: UIViewController {
    
     // MARK: - UI Properties
    
    private var buttonStates: [Bool] = []
    private let cartTabView = CartTabView()
    private let cartView = CartPriceView()
    private let payView = payButtonView()

    private let cartNavi = CustomNavigaionView(type1: .cart(.leftButton), type2: .cart(.rightButton), storeName: "")
 //   let count: [Int] = []
    private var cartArray: [FoodsList] = []
    private var foodArray: [FoodItem] = []
    private var totalPrice: Int = 0
    private var totalCount: Int = 0
    private var checkedCount: Int = 0
    private var totalPayWithDeliveryTips: Int = 0
    private var tableviewHeight: Int = 0
    
    private var willDeleteSectionIndex: Int = -1
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .background
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let contentView = UIView()

    private let cartTableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.register(CartTableSectionViewCell.self, forCellReuseIdentifier: CartTableSectionViewCell.identifier)
        tableview.rowHeight = 156
        tableview.backgroundColor = .background
        tableview.layer.cornerRadius = 8
        tableview.sectionHeaderTopPadding = 16
        return tableview
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestCartAPI(index: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
}

// MARK: - Methods

private extension CartViewController {
    
    func didTapButton() {
        let newViewController = StoreDetailVC()
        //let newViewController = RenewalVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setStyle() {
        view.backgroundColor = .white
        scrollView.backgroundColor = .background
        cartNavi.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        cartNavi.iconButton.leftButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
    }
    
    func setLayout() {
        view.addSubviews(cartNavi, cartTabView, payView, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(cartTableView, cartView)

        cartNavi.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        cartTabView.snp.makeConstraints {
            $0.top.equalTo(cartNavi.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        payView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.height.equalTo(100)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(cartTabView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(payView.snp.top)
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        cartTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(700)
        }
        cartView.snp.makeConstraints {
            $0.top.equalTo(cartTableView.snp.bottom)
            $0.height.equalTo(220)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate, TableSectionHeaderDelegate {
    func passSelectedSection(section: Int) {
        UIView.setAnimationsEnabled(false)
        cartTableView.beginUpdates()
        cartTableView.deleteSections(IndexSet([section]), with: .middle)
        foodArray.remove(at: section)
        cartArray.remove(at: section)
        
        cartTableView.reloadData()
        cartTableView.endUpdates()
        
        self.totalPrice = 0
        self.totalCount = 0
        self.totalPayWithDeliveryTips = 0
        
        foodArray.forEach { item in
            totalPrice += item.foodCount * item.price
            totalCount += item.foodCount
            totalPayWithDeliveryTips += item.foodCount * item.price
            
        }
        
        cartArray.forEach { item in
            totalPayWithDeliveryTips += item.deliveryFee
        }
        
        let totalPriceString = addCommaToPrice(totalPrice)
        let totalPayString = addCommaToPrice(totalPayWithDeliveryTips)
        
        cartView.passTotalPrice(price: totalPriceString)
        cartView.passTotalPay(pay: totalPayString)
        
        payView.passCount(count: totalCount)
        payView.passPay(pay: totalPayString)
        
        self.tableviewHeight -= 430
        
        self.cartTableView.snp.updateConstraints {
            $0.height.equalTo(tableviewHeight)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return cartArray.count
    }

//    table
    // section header 설정

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let headerView = CartTableSectionHeaderView()
        headerView.dataBind(item: cartArray[section])
        headerView.delegate = self
        headerView.section = section
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0 // Example: Set the height of the section header
    }
    
    // section footer 설정

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = CartTableSectionFooterView()
        footerView.dataBind(item: foodArray[section])
        
        let button = footerView.addMenuButton
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 194.0
    }

    // section 내부 cell 설정

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(cartArray[section].storeID)
        return cartArray[section].foods.count  // 서버 연결하면 장바구니 가게의 메뉴 수로 바꾸기
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableSectionViewCell.identifier, for: indexPath) as? CartTableSectionViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.dataBind(item: cartArray[indexPath.section].foods[indexPath.item])
        
        cell.countClosure = { [weak self] result in
            if result {
                if !cell.menuCheckButton.isSelected {
                    self?.checkedCount += 1
                    print(cell.menuCheckButton.isSelected)
                } else {
                    self?.checkedCount -= 1
                }
                cell.menuCheckButton.isSelected.toggle()
            }
        }
        return cell
    }
    
    @objc func buttonTapped() {
        let newViewController = StoreDetailVC()
        //let newViewController = RenewalVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc
    func homeButtonTapped() {
        let vc = MainVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelectHeaderButton(section: Int, selected: Bool) {
        let indexPaths = (0..<self.cartTableView.numberOfRows(inSection: section)).map { IndexPath(row: $0, section: section) }
            for indexPath in indexPaths {
                if let cell = self.cartTableView.cellForRow(at: indexPath) as? CartTableSectionViewCell {
                    cell.updateButtonSelection(selected: selected)
                }
            }
        }
}

extension CartViewController {
    private func addCommaToPrice(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(from: NSNumber(value: price)) else { return "" }
        
        return result
    }
    
    private func requestCartAPI (index: Int) {
        CartAPI.shared.getCart(id: index + 1) { response in
            print("🍀🍀🍀 response 🍀🍀🍀")
            print(response)
            switch response {
            case .success(let data):
                guard let data = data as? CartResponseDTO else { return }
                let dataArray = data.data
                var totalPrice: Int = 0
                var totalCount: Int = 0
                                
                for item in dataArray {
                    self.foodArray.append(item.foods[0])
                    self.cartArray.append(item)
                    totalPrice += item.foods[0].foodCount * item.foods[0].price
                    totalCount += item.foods[0].foodCount
                    self.totalPayWithDeliveryTips += item.foods[0].foodCount * item.foods[0].price + item.deliveryFee

                    print("🤤\(self.cartArray)")
                }
                
                let priceString = self.addCommaToPrice(totalPrice)
                let payString = self.addCommaToPrice(self.totalPayWithDeliveryTips)
                
                self.payView.passPay(pay: payString)
                self.payView.passCount(count: totalCount)
                self.cartView.passTotalPrice(price: priceString)
                self.cartView.passTotalPay(pay: payString)
                
                self.cartTableView.reloadData()
                
                let modifiedHeight = self.cartArray.count * 430
                
                self.cartTableView.snp.updateConstraints {
                    $0.height.equalTo(modifiedHeight)
                }
                
                self.tableviewHeight = modifiedHeight
                
                print(data.data)
                print("🍀🍀🍀  ARRAY에 담긴 데이터들  🍀🍀🍀")
            default:
                print("🍀🍀🍀  왜 안 오ㅏ  🍀🍀🍀")
                print(response)
            }
        }
    }
}
