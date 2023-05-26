//
//  CartTableViewCell.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/20.
//

import UIKit

import SnapKit

class CartTableSectionViewCell: UITableViewCell {
    
    // MARK: - UI Properties

    static let idf = NSObject.identifier
    
    // 메뉴 Stackview 구성
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let menuImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = .dummy
        imageview.makeCornerRound(radius: 8)
        return imageview
    }()
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "test 메뉴이름"
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()
    
    private let menuPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "test 메뉴가격"
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        return label
    }()
        
    private let menuCheckButton: UIButton = {
        let button = UIButton()
        button.setImage(.circle_empty, for: .normal)
        button.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
        return button
    }()
    
    // 메뉴 StackView - 메뉴 수량 버튼
    
    private let menuCountView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .AppleSDGothicNeo(.medium, size: 14)
        return label
    }()

    private let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(.minus, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 8)
        //button.addTarget(self, action: Selector(changeMinusButton), for: .touchUpInside)
        return button
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(.plus, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 10)
        return button
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
}

// MARK: - Methods

private extension CartTableSectionViewCell {
    
    func setStyle() {
        self.backgroundColor = .white
    }
    
    func setLayout() {
        contentView.addSubview(menuStackView)
        menuStackView.addSubviews(menuCheckButton, menuImageView, menuNameLabel, menuPriceLabel, menuCountView)
        menuCountView.addSubviews(menuCountLabel, minusButton, plusButton)
        
        menuStackView.snp.makeConstraints {
            $0.width.equalTo(351)
            $0.height.equalTo(156)
        }
        menuCheckButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(14)
            $0.width.height.equalTo(24)
        }
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(menuCheckButton.snp.trailing).offset(12)
            $0.width.height.equalTo(68)
        }
        menuNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(14)
        }
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(14)
        }
        menuCountView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(96)
            $0.height.equalTo(32)
        }
        
        // 수량 버튼
        
        minusButton.snp.makeConstraints {
            $0.width.equalTo(34)
            $0.height.equalTo(32)
            $0.top.leading.bottom.equalToSuperview()
        }
        plusButton.snp.makeConstraints {
            $0.width.equalTo(34)
            $0.height.equalTo(32)
            $0.top.trailing.bottom.equalToSuperview()
        }
        menuCountLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc
    func changeButton() {
        if (menuCheckButton.currentImage == .circle_empty) {
            menuCheckButton.setImage(.checked, for: .normal)
        }
        else {
            menuCheckButton.setImage(.circle_empty, for: .normal)
        }
    }
    
    @objc
    func changeMinusButton() {
        if (menuCountLabel.text == "2") {
            minusButton.setImage(.trashbin, for: .normal)
            menuCountLabel.text = "1"
        }
    }
}
