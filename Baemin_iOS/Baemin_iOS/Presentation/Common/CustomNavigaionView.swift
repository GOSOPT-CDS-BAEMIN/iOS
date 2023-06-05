//
//  CustomNavigaionView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

import SnapKit

final class CustomNavigaionView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    lazy var backButton: ButtonStackView = {
        let back = ButtonStackView()
        return back
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = .AppleSDGothicNeo(.bold, size: 18)
        return title
    }()
    
    var storeName: UILabel = {
        let title = UILabel()
        title.font = .AppleSDGothicNeo(.semiBold, size: 16)
        return title
    }()
    
    lazy var iconButton: ButtonStackView = {
        let icon =  ButtonStackView()
        return icon
    }()
    
    // MARK: - Life Cycle
    
    init(type1: NaviType, type2: NaviType, storeName: String) {
        super.init(frame: .zero)
        setStyle(type1: type1, type2: type2, storeName: storeName)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

private extension CustomNavigaionView {
    
    func setStyle(type1: NaviType, type2: NaviType, storeName: String) {
        switch (type1, type2) {
        case (.main(let subItem1), .main(let subItem2)):
            backButton.leftButton.setImage(subItem1.leftIcon, for: .normal)
            backButton.rightButton.setImage(subItem1.rightIcon, for: .normal)
            iconButton.leftButton.setImage(subItem2.leftIcon, for: .normal)
            iconButton.rightButton.setImage(subItem2.rightIcon, for: .normal)
        case (.cart(let subItem1), .cart(let subItem2)):
            backButton.leftButton.setImage(subItem1.leftIcon, for: .normal)
            backButton.rightButton.setImage(subItem1.rightIcon, for: .normal)
            iconButton.leftButton.setImage(subItem2.leftIcon, for: .normal)
            iconButton.rightButton.setImage(subItem2.rightIcon, for: .normal)
        case (.menu(let subItem1), .menu(let subItem2)):
            backButton.leftButton.setImage(subItem1.leftIcon, for: .normal)
            backButton.rightButton.setImage(subItem1.rightIcon, for: .normal)
            iconButton.leftButton.setImage(subItem2.leftIcon, for: .normal)
            iconButton.rightButton.setImage(subItem2.rightIcon, for: .normal)
        case (.store(let subItem1), .store(let subItem2)):
            backButton.leftButton.setImage(subItem1.leftIcon, for: .normal)
            backButton.rightButton.setTitle((subItem1.rightIcon as? String), for: .normal)
            iconButton.leftButton.setImage(subItem2.leftIcon, for: .normal)
            iconButton.rightButton.setImage((subItem2.rightIcon as? UIImage), for: .normal)
        case (_, _): break
        }
        
        title.text = type1.title
        self.storeName.text = storeName
    }
    
    func setLayout() {
        addSubviews(backButton, storeName, title, iconButton)
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(CGSize(width: 55, height: 20))
        }
        
        storeName.snp.makeConstraints { 
            $0.leading.equalTo(backButton.snp.trailing)
            $0.top.equalTo(backButton.snp.top)
            $0.height.equalTo(backButton.snp.height)
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        iconButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(CGSize(width: 55, height: 20))
        }
    }
}
