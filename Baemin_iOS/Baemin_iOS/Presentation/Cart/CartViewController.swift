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

    private let cartNetworkManager = CartNetworkManager.shared
    private var buttonStates: [Bool] = []
    private let cartTabView = CartTabView()
    private let cartView = CartPriceView()
    private let payView = payButtonView()
    private let cartNavi = CustomNavigaionView(type1: .cart(.leftButton), type2: .cart(.rightButton))
    
    private var cartArray: [FoodsList] = []
    private var totalPrice: Int = 0
    private var totalCount: Int = 0
    private var checkedCount: Int = 0
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        didTapButton()
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        getCartData {
            self.cartTableView.reloadData()
            self.cartArray.forEach { foodList in
                let foods = foodList.foods
                foods.forEach {
                    self.totalCount += $0.foodCount
                    let perPrice = $0.price * $0.foodCount
                    self.totalPrice += perPrice
                }
            }
        }
    }
}

// MARK: - Methods

private extension CartViewController {
    
    func didTapButton() {
        let newViewController = StoreDetailVC()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setStyle() {
        view.backgroundColor = .white
        scrollView.backgroundColor = .background
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
            $0.height.equalTo(numberOfSections(in: cartTableView)*600)
            // $0.height.equalTo(cartArray.count * 156 + numberOfSections(in: cartTableView) * 255)
        }
        cartView.snp.makeConstraints {
            $0.top.equalTo(cartTableView.snp.bottom)
            $0.height.equalTo(220)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

class ScrollableSectionHeaderView: UITableViewCell {
    var headerView: UIView?
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 //cartArray.count // 서버 연결하면 장바구니의 가게 수로 바꾸기
    }
            
    // section header 설정

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let headerView = CartTableSectionHeaderView()
        headerView.headerClosure = { [weak self] result in
            if result {
                for row in 0...2 { // 서버 연결하면 2를 cartArray.count 로 바꾸기
                    if  let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? CartTableSectionViewCell {
                        cell.menuCheckButton.isSelected.toggle()
                    }
                    headerView.storeCheckButton.isSelected.toggle()

                }
            }
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0 // Example: Set the height of the section header
    }
    
    // section footer 설정

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = CartTableSectionFooterView()
        let button = footerView.addMenuButton
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 194.0 // Example: Set the height of the section header
    }
    
    // section 내부 cell 설정

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //cartArray[section].foods.count  // 서버 연결하면 장바구니 가게의 메뉴 수로 바꾸기
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableSectionViewCell.identifier, for: indexPath) as? CartTableSectionViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.countClosure = { [weak self] result in
            if result {
                if !cell.menuCheckButton.isSelected {
                    self?.checkedCount += 1
                    print(self?.checkedCount)
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
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension CartViewController {
    func getCartData(completion: @escaping () -> Void) {
        cartNetworkManager.fetchCartList { response in
            switch response {
            case .success(let data):
                guard let data = data as? CartListModel else {
                    return }
                self.cartArray = data.data
                completion()
            default:
                print("NetworkFailed")
                completion()
            }
        }
    }
}
