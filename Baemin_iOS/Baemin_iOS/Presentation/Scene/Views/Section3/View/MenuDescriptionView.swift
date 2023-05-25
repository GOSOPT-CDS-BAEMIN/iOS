//
//  MenuDescriptionView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuDescriptionView: UIView {
    
    private let madinBtn: UIButton = {
        let btn = UIButton()
        
    }
    
    private lazy var description: UILabel = {
        let label = UILabel()
        label.text = I18N.Description.descriptions
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.sizeToFit()
        return label
    }()
    
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
