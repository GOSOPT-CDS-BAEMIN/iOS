//
//  CustomNavigaionView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

import SnapKit

class CustomNavigaionView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private lazy var backButton: ButtonStackView = {
        let back = ButtonStackView()
        back.rightButton.setImage(UIImage.arrow_back, for: .normal) 
        return back
    }()
    private let title: UILabel = {
       let title = UILabel()
        return title
    }()
    private lazy var iconButton: ButtonStackView = {
        let icon =  ButtonStackView()
        return icon
    }()
    
    // MARK: - Life Cycle
    
    init(type: NaviType) {
        super.init(frame: .zero)
        setStyle(type: type)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomNavigaionView {
    
    private func setStyle(type: NaviType) {
        backButton.rightButton.setImage(type.rightIcon, for: .normal)
        title.text = type.title
    }
    private func setLayout() {
        addSubviews(backButton, title, iconButton)
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(CGSizeMake(55, 20))
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        iconButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(CGSizeMake(55, 20))
        }
    }
}
