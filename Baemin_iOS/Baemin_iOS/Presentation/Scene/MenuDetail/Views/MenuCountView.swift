//
//  MenuCountView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class MenuCountView: UIView {
    
    var count: Int = 0
    var priceClosure: ((_ count: Int) -> Void)?
    private let horizontalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(.minus, for: .normal)
        button.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        return button
    }()
    
     var numberLabel: UILabel = {
        let label = UILabel()
        label.basic(text: "0개",
                    font: .AppleSDGothicNeo(.regular, size: 14),
                    color: .black)
        return label
    }()
    
    private lazy var plusButton: UIButton = {
       let button = UIButton()
        button.setImage(.plus, for: .normal)
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MenuCountView {
    private func setStyle() {
        backgroundColor = .clear
        makeCornerRound(radius: 2)
        makeBorder(width: 2, color: .gray_4!)
        clipsToBounds = true
    }
    
    private func setLayout() {
        addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubviews(minusButton, numberLabel, plusButton)
        
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        minusButton.snp.makeConstraints {
            $0.size.equalTo(42)
        }
        plusButton.snp.makeConstraints {
            $0.size.equalTo(42)
        }
    }
}

// MARK: - Actions

extension MenuCountView {
    @objc
    func plusTapped() {
        print("plus")
        count += 1
        numberLabel.text = "\(count)개"
        self.priceClosure?(count)
        if count < 0 {
            count = 1
            numberLabel.text = "\(count)개"
            self.priceClosure?(count)
        }
    }
    
    @objc
    func minusTapped() {
        print("minus")
        count -= 1
        if count >= 0 {
            numberLabel.text = "\(count)개"
            self.priceClosure?(count)
        }
    }
}
