//
//  ViewController.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/13.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    let cartView = CartPriceView()
    
    private let navi1 = CustomNavigaionView(type: .main)
    private let navi2 = CustomNavigaionView(type: .menu)
    private let navi3 = CustomNavigaionView(type: .cart)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(navi1, navi2, navi3)
        
        navi1.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(44)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        navi2.snp.makeConstraints {
            $0.top.equalTo(navi1.snp.bottom)
            $0.height.equalTo(44)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        navi3.snp.makeConstraints {
            $0.top.equalTo(navi2.snp.bottom)
            $0.height.equalTo(44)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        }
        // Do any additional setup after loading the view.
    }
