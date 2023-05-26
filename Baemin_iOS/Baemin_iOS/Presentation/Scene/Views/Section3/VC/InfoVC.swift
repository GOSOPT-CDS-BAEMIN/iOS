//
//  InfoVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }

    let deliveryView = DeliveryView()
    
    func setStyle() {
        view.addSubview(deliveryView)
        
        deliveryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
