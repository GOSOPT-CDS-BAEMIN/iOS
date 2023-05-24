//
//  CartPriceView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/19.
//

import UIKit

import SnapKit

class CartPriceView: UIView {

    // MARK: - UI Properties

    // 1. 총 주문금액 StackView
    private let totalPriceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()

    private let emptyView_1 = UIView()

    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.totalPrice
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        return label
    }()

    var totalPriceValueLabel: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        return label
    }()

    // 중간 선
    private let middleLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray_3
        return view
    }()

    // 2. 결제 예상 금액 StackView
    private let totalPayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .white
        return stackView
    }()

    private let emptyView_2 = UIView()

    private let totalPayLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.totalPay
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()

    var totalPayValueLabel: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()

    private let deliveryTipLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.text = I18N.Cart.deliveryTip
        label.font = .AppleSDGothicNeo(.regular, size: 10)
        label.backgroundColor = .gray_2
        label.clipsToBounds = true
        label.layer.cornerRadius = 4
        return label
    }()

    // 3. 주의사항 Label
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Cart.notice
        label.font = .AppleSDGothicNeo(.regular, size: 12)
        label.numberOfLines = 0
        label.textColor = .gray_5
        return label
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

private extension CartPriceView {

    func setStyle() {
        addSubviews(totalPriceStackView, middleLineView, totalPayStackView, noticeLabel)
    }

    func setLayout() {
        totalPriceStackView.addArrangedSubviews(totalPriceLabel, emptyView_1, totalPriceValueLabel)
        totalPayStackView.addArrangedSubviews(totalPayLabel, deliveryTipLabel, emptyView_2, totalPayValueLabel)

        // 총 주문 금액 배치
        totalPriceStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(71)
        }
        totalPriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }
        emptyView_1.snp.makeConstraints {
            $0.leading.equalTo(totalPriceLabel.snp.trailing)
            $0.trailing.equalTo(totalPriceValueLabel.snp.leading)
            $0.directionalVerticalEdges.equalToSuperview()
        }
        totalPriceValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }

        // 중간 선
        middleLineView.snp.makeConstraints {
            $0.top.equalTo(totalPriceStackView.snp.bottom)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().offset(14)
        }

        // 결제 예상 금액 배치
        totalPayStackView.snp.makeConstraints {
            $0.top.equalTo(middleLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(59)
        }
        totalPayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }
        deliveryTipLabel.snp.makeConstraints {
            $0.leading.equalTo(totalPayLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(20)
        }
        emptyView_2.snp.makeConstraints {
            $0.leading.equalTo(deliveryTipLabel.snp.trailing)
            $0.trailing.equalTo(totalPayValueLabel.snp.leading)
            $0.directionalVerticalEdges.equalToSuperview()
        }
        totalPayValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
        }

        // 주의사항 배치
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(totalPayStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview().offset(16)
            $0.height.equalTo(86)
        }
    }
}
