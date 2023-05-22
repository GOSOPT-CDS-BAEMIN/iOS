//
//  CartViewController.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/19.
//

import UIKit

import SnapKit

class CartViewController: UIViewController {
    
    private let cartView = CartPriceView()
    
    private let cartTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CartTableSectionViewCell.self, forCellReuseIdentifier: CartTableSectionViewCell.identifier)
        // tableview.tableHeaderView =
        // tableview.tableHeaderView?.frame.size.height = 80
        tableview.rowHeight = 156
        tableview.backgroundColor = .white
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()

    }
}

private extension CartViewController {
    func setStyle() {
        view.backgroundColor = .background
    }
    func setLayout() {
        view.addSubviews(cartTableView, cartView)
        
        cartTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(12)
            $0.width.equalTo(30)
        }

        cartView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(50)
            $0.top.equalTo(cartTableView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }
}

// 스크롤뷰, 컬렉션뷰, CartPriceView 불러오기
