//
//  CartTableSectionFooterView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/22.
//

import UIKit

import SnapKit

class CartTableSectionFooterView: UIView {
    
    // MARK: - UI Properties
    
    // 첫번째 부분
    
    private let firstFooterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let deliveryCheckButton: UIButton = {
        let button = UIButton()
        button.setImage(.radio_delivery, for: .normal)
        return button
    }()
    
    private let pickupCheckButton: UIButton = {
        let button = UIButton()
        button.setImage(.radio_pickup, for: .normal)
        return button
    }()
    
    private let lineView_1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray_3
        return view
    }()
    
    // 두번째 부분
    
    private let addMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Cart.addMenu, for: .normal)
        button.setTitleColor(.primary_2, for: .normal)
        button.titleLabel?.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        return button
    }()
    
    private let lineView_2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray_3
        return view
    }()
    
    // 세번째 부분
    
    private let thirdFooterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()

    private let menuTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "총 n개"
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.textColor = .gray_5
        return label
    }()
    
    private let storeTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "test원"
        label.font = .AppleSDGothicNeo(.semiBold, size: 16)
        return label
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Cart.order, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.AppleSDGothicNeo(.semiBold, size: 16)
        button.backgroundColor = .primary_2
        return button
    }()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CartTableSectionFooterView {
    
    private func setLayout() {
        self.addSubviews(firstFooterStackView, lineView_1, addMenuButton, lineView_2, thirdFooterStackView)
        firstFooterStackView.addSubviews(deliveryCheckButton, pickupCheckButton)
        thirdFooterStackView.addSubviews(menuTotalLabel, storeTotalPriceLabel, orderButton)
        self.backgroundColor = .white
        
        // 배달, 포장 선택 구역
        
        firstFooterStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        deliveryCheckButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(18)
            $0.width.equalTo(76)
            $0.height.equalTo(24)
        }
        pickupCheckButton.snp.makeConstraints {
            $0.top.equalTo(deliveryCheckButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(76)
            $0.height.equalTo(24)
        }
        
        // 중간선 1
        
        lineView_1.snp.makeConstraints {
            $0.top.equalTo(firstFooterStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        // 메뉴 추가하기 버튼
        
        addMenuButton.snp.makeConstraints {
            $0.top.equalTo(lineView_1.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        // 중간선 2
        
        lineView_2.snp.makeConstraints {
            $0.top.equalTo(addMenuButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        // 총 주문 금액 및 주문 버튼 구역
        
        thirdFooterStackView.snp.makeConstraints {
            $0.top.equalTo(lineView_2.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        menuTotalLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.centerY.equalToSuperview()
        }
        storeTotalPriceLabel.snp.makeConstraints {
            $0.leading.equalTo(menuTotalLabel.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        orderButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(155)
        }
    }
    
}
