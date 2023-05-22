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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(cartView)
        cartView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(50)
            $0.top.bottom.equalToSuperview()
        }
    }
    
}

// 스크롤뷰, 컬렉션뷰, CartPriceView 불러오기
