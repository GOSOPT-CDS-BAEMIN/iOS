//
//  MenuVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuVC: UIViewController {
    
    let descriptionView = MenuDescriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStyle()
        setLayOut()
    }
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayOut() {
        view.addSubview(descriptionView)
        
        descriptionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(21)
            $0.bottom.equalToSuperview()
        }
    }

}
