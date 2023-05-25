//
//  MenuView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuView: UIView {
    
    // 0. init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle() {
        backgroundColor = .clear
    }
    
    func setLayOut() {
        
    }
}
