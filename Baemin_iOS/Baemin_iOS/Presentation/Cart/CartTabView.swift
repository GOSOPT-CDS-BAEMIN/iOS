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
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private let chooseStoreButton: UIButton = {
        let button = UIButton()
        button.setImage(.circle_empty, for: .normal)
        button.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
        return button
    }()

    private let chooseAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체선택(n/N)"
        label.font = .AppleSDGothicNeo(.medium, size: 14)
        return label
    }()

    private let deleteMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Cart.deleteMenu, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.AppleSDGothicNeo(.medium, size: 14)
        return button
    }()

    private let emptyView = UIView()

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
        cartTabView.addArrangedSubviews(chooseStoreButton, emptyView, chooseAllLabel, deleteMenuButton)
        
        cartTabView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        chooseStoreButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        emptyView.snp.makeConstraints {
            $0.leading.equalTo(chooseStoreButton.snp.trailing)
            $0.width.equalTo(6)
        }
        chooseAllLabel.snp.makeConstraints {
            $0.leading.equalTo(emptyView.snp.trailing)
            $0.centerY.equalToSuperview()
        }
        deleteMenuButton.snp.makeConstraints {
            $0.leading.equalTo(chooseAllLabel.snp.trailing).offset(191)
            $0.centerY.equalToSuperview()
        }
    }

    @objc
    func changeButton() {
        if (chooseStoreButton.currentImage == .circle_empty) {
            chooseStoreButton.setImage(.checked, for: .normal)
        }
        else {
            chooseStoreButton.setImage(.circle_empty, for: .normal)
        }
    }
}
