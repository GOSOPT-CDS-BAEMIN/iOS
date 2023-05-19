//
//  CartPriceView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/19.
//

import UIKit
import SnapKit

class CartPriceView: UIView {

    private let totalPriceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let totalPayStackView = UIStackView()
        
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.totalPrice
        return label
    }()
    
    private let totalPayLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.totalPay
        return label
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.notice
        return label
    }()
    
    private let deliveryTipLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.deliveryTip
        return label
    }()
    
    var totalPriceValueLabel = UILabel()
    var totalPayValueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartPriceView {
    
    func setStyle() {
        addSubview(totalPriceStackView)
        addSubview(totalPayStackView)
    }
    
    func setLayout() {
        totalPayStackView.addArrangedSubviews(totalPayLabel, totalPayValueLabel)
        totalPriceStackView.addArrangedSubviews(totalPriceLabel, totalPriceValueLabel)
        noticeLabel.addSubviews()
        
        totalPriceStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
        }
        totalPayStackView.snp.makeConstraints{
            $0.top.equalTo(totalPriceStackView)
        }
        noticeLabel.snp.makeConstraints{
            $0.top.equalTo(totalPayStackView)
        }
    }
    
    
    
}
