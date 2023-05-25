//
//  MenuVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        setStyle()
    }

    let deliveryView = DeliveryView()
    
    func setStyle() {
        view.addSubview(deliveryView)
        
        deliveryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}