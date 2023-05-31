//
//  orderButtonView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/24.
//

import UIKit

import SnapKit

class payButtonView: UIView {
    
    private let payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary_2
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.AppleSDGothicNeo(.bold, size: 18)
        button.layer.cornerRadius = 4
        return button
    }() // 서버에서 title 받기

    private let countLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = .AppleSDGothicNeo(.extraBold, size: 14)
        label.textColor = .primary_2
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        countLabel.layer.masksToBounds = true
        countLabel.layer.cornerRadius = self.countLabel.frame.width / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension payButtonView {

    private func setStyle() {
        self.backgroundColor = .white
        addSubviews(payButton, countLabel)
    }

    private func setLayout() {
        payButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().inset(38)
            $0.leading.trailing.equalToSuperview().inset(10)
        }

        countLabel.snp.makeConstraints {
            $0.centerY.equalTo(payButton.snp.centerY)
            $0.leading.equalTo(payButton.snp.leading).inset(18)
            $0.size.equalTo(24)
        }
    }
}

extension payButtonView {

    func passPrice(price: Int) {
        let priceText = "배달주문 \(price)원 결제하기"
        self.payButton.setTitle(priceText, for: .normal)
    }

    func passCount(count: Int) {
        self.countLabel.text = "\(count)"
    }

}
