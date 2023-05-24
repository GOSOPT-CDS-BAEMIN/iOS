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
    
    private let cartTabView = CartTabView()
    private let cartView = CartPriceView()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .background
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let cartTableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.register(CartTableSectionViewCell.self, forCellReuseIdentifier: CartTableSectionViewCell.identifier)
        // tableview.tableHeaderView = CartTableSectionHeaderView()
        // tableview.tableHeaderView?.frame.size.height = 60
        // tableview.tableFooterView = CartTableSectionFooterView()
        // tableview.tableFooterView?.frame.size.height = 194
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
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
}

// MARK: - Methods

private extension CartViewController {
    func setStyle() {
        view.backgroundColor = .background
    }
    func setLayout() {
        view.addSubviews(cartTabView, scrollView)
        scrollView.addSubviews(cartTableView, cartView)
        
        cartTabView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(88)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(cartTabView.snp.bottom)
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
            $0.width.equalToSuperview()ㅕㅑ
            $0.bottom.equalTo(view.layoutMarginsGuide) // 맨 아래 버튼 만들면 바꾸기
        }
        cartTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalTo(scrollView.snp.bottom).offset(210)
        }
        cartView.snp.makeConstraints {
            $0.top.equalTo(cartTableView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

class ScrollableSectionHeaderView: UITableViewCell {
    var headerView: UIView?
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // 서버 연결하면 장바구니의 가게 수로 바꾸기
    }
            
    // section header 설정

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CartTableSectionHeaderView()
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0 // Example: Set the height of the section header
    }
    
    // section footer 설정

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = CartTableSectionFooterView()
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 194.0 // Example: Set the height of the section header
    }
    
    // section 내부 cell 설정

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // 서버 연결하면 장바구니 가게의 메뉴 수로 바꾸기
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableSectionViewCell.identifier, for: indexPath) as? CartTableSectionViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
}
