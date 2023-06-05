//
//  StoreDetailVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/19.
//

import UIKit

import SnapKit

import SafeAreaBrush

class StoreDetailVC: UIViewController {

    // MARK: - Properties
    
    private let rowNum = [1, 1, 1, 5, 4]
    
    private let navigationBar = CustomNavigaionView(type1: .store(.leftButton), type2: .store(.rightButton), storeName: "산시도삭면")
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let stickyHead: UIView = StickyHeaderView()
    private let contentView: UIView = UIView()
    let topSafeArea = UIView()
    
    // StoreInfo 값을 받으면 테이블뷰를 reload 해준다
    
    var storeItem: [MainData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var index = 0
    var dataIndex = 0
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isScrollEnabled = true
        scroll.insetsLayoutMarginsFromSafeArea = false
        return scroll
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.sectionHeaderHeight = UITableView.automaticDimension
        table.sectionFooterHeight = UITableView.automaticDimension
        table.rowHeight = UITableView.automaticDimension
        table.bounces = true
        return table
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
        register()
        setNotificationCenter()
    }
    
    // MARK: - Methods

    private func setStyle() {
        view.backgroundColor = .white
        stickyHead.isHidden = true
        navigationBar.storeName.isHidden = true
        
        navigationBar.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        navigationBar.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        
        tableView.contentInsetAdjustmentBehavior = .never
        contentView.insetsLayoutMarginsFromSafeArea = false
    }
    
    private func setLayOut() {
        
        view.addSubviews(contentView, topSafeArea, navigationBar, stickyHead)
        contentView.addSubview(tableView)
        
        contentView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(-50)
        }
        
        topSafeArea.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(view.snp.top)
            $0.height.equalTo(40)
        }
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(topSafeArea.snp.bottom)
            $0.height.equalTo(53)
            $0.directionalHorizontalEdges.equalTo(safeArea)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stickyHead.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(92)
            $0.height.equalTo(40)
        }
    }
    
    private func register() {
        tableView.register(FirstHeaderView.self, forHeaderFooterViewReuseIdentifier: FirstHeaderView.identifier)
        tableView.register(StoreInfoCell.self, forCellReuseIdentifier: StoreInfoCell.identifier)
        tableView.register(OrderMethodSelectView.self, forHeaderFooterViewReuseIdentifier: OrderMethodSelectView.identifier)
        tableView.register(OrderInfoCell.self, forCellReuseIdentifier: OrderInfoCell.identifier)
        tableView.register(StickyTargetHeader.self, forHeaderFooterViewReuseIdentifier: StickyTargetHeader.identifier)
        tableView.register(DetailInfoCell.self, forCellReuseIdentifier: DetailInfoCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int
        
        if tmp == 1 {
            let bottomSheet = ReviewBottomSheetVC()
            bottomSheet.index = self.index
            
            if let sheet = bottomSheet.sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.selectedDetentIdentifier = .medium
                sheet.largestUndimmedDetentIdentifier = .large
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 10.0
            }
            self.present(bottomSheet, animated: true)
        }
    }
    
    @objc func moveDataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int
        
        if tmp == 1 {
            let vc = MenuDetailVC()
            self.navigationController?.isNavigationBarHidden = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("popUp"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveDataReceived(_:)), name: NSNotification.Name("gotoMenuDetailVC"), object: nil)
    }
}

extension StoreDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션의 개수 정의
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 각 섹션마다의 셀 개수 정의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNum[section]
    }
    
    // 각 섹션마다의 보여줄 셀 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoreInfoCell.identifier, for: indexPath) as? StoreInfoCell else { return UITableViewCell() }
            cell.isCoupon(storeItem[0].couponExist)
            cell.bind(storeItem[0])
            cell.ratingStarImg(storeItem[0].rate)
            return cell
        case 1:
            guard let deliverCell = tableView.dequeueReusableCell(withIdentifier: OrderInfoCell.identifier, for: indexPath) as? OrderInfoCell else { return UITableViewCell()
            }
            deliverCell.bind(storeItem[0])
            return deliverCell
        default:
            guard let detailInfoCell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.identifier, for: indexPath) as? DetailInfoCell else { return UITableViewCell()
            }
            return detailInfoCell
        }
    }
    
    // 섹션 헤더뷰 보여주기
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: FirstHeaderView.identifier) as! FirstHeaderView
            return view
        case 1:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrderMethodSelectView.identifier) as! OrderMethodSelectView
            return view
        default:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: StickyTargetHeader.identifier) as! StickyTargetHeader
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension StoreDetailVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shouldShowSticky = scrollView.contentOffset.y >= 647
        stickyHead.isHidden = !shouldShowSticky
        
        let navigationBarWhite = scrollView.contentOffset.y >= 280
        var backgroundColor: UIColor = navigationBarWhite ? UIColor.white : UIColor.clear
        navigationBar.backgroundColor = backgroundColor
        topSafeArea.backgroundColor = backgroundColor
        navigationBar.storeName.isHidden = !navigationBarWhite
    }
}

extension StoreDetailVC {
    @objc
    func backButtonTapped() {
        self.navigationController?
            .popViewController(animated: true)
    }
    
    @objc
    func cartButtonTapped() {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setDeliveryView() -> DeliveryView {
        let view = DeliveryView(frame: .zero, price: storeItem[0].minOrderPrice, time: "\(storeItem[0].deliveryTime)")
        return view
    }

}
