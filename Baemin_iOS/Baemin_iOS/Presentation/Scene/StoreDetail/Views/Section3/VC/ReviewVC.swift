//
//  ReviewVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class ReviewVC: UIViewController {
    
    private let reviewView = ReviewTab()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        // Do any additional setup after loading the view.
        setStyle()
    }
    
    func setStyle() {
        view.addSubview(reviewView)
        
        reviewView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(34)
            $0.bottom.equalToSuperview()
        }
    }
}
