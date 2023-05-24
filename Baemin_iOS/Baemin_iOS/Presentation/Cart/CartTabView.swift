//
//  CartTabView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/23.
//

import UIKit

import SnapKit

class CartTabView: UIView {
    
    private let cartTabView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let chooseStoreButton: UIButton = {
        let button = UIButton()
        button.setImage(.circle_empty, for: .normal)
        return button
    }()

    private let chooseAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체선택(n/N)"
        label.font = .AppleSDGothicNeo(.medium, size: 14)
        return label
    }()
    
    private let emptyTabView = UIView()
    
    private let deleteMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Cart.deleteMenu, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.AppleSDGothicNeo(.medium, size: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CartTabView {
    func setStyle() {
        addSubview(cartTabView)
    }
    func setLayout() {
        cartTabView.addArrangedSubviews(chooseStoreButton, chooseAllLabel, deleteMenuButton)
        
        cartTabView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        chooseStoreButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        chooseAllLabel.snp.makeConstraints {
            $0.leading.equalTo(chooseStoreButton.snp.trailing).offset(6)
            $0.centerY.equalToSuperview()
        }
        /*
        emptyTabView.snp.makeConstraints {
            $0.leading.equalTo(chooseAllLabel.snp.trailing)
            $0.top.bottom.equalToSuperview()
        }
        */
        deleteMenuButton.snp.makeConstraints {
            $0.leading.equalTo(chooseAllLabel.snp.trailing).inset(191)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
}
