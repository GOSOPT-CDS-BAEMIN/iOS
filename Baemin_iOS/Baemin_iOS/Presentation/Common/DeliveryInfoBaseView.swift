//
//  DeliveryInfoBaseView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class DeliveryInfoBaseView: UIView {
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 왼쪽에 쌓일 라벨
    var leftView: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        return label
    }()
    
    // 오른쪽에 쌓일 라벨
    var rightView: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.AppleSDGothicNeo(.regular, size: 16)
        return label
    }()
    
    // 1. horizontal stack view
    private let deliveryInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.sizeToFit()
        return stackView
    }()
    
    private func makeStackView() {
        backgroundColor = .clear
        
        deliveryInfoStack.addArrangedSubviews(leftView, rightView)
        
        addSubview(deliveryInfoStack)
        
        deliveryInfoStack.setCustomSpacing(8.0, after: leftView)
        
        deliveryInfoStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        leftView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(84)
        }
        
        rightView.snp.makeConstraints {
            $0.leading.equalTo(leftView.snp.trailing).offset(8)
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
