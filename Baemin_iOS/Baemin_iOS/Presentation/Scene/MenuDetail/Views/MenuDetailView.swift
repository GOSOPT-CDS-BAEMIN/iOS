//
//  MenuDetailView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class MenuDetailView: UIView {
    
    private let priceView =  UIView()
    private let numberView = UIView()
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.basic(text: "플레인 츄러스",
                    font: .AppleSDGothicNeo(.bold, size: 18),
                    color: .black)
        return label
    }()
    
    private let menuDetailLabel: UILabel = {
        let label = UILabel()
        label.basic(text: "바삭하고 담백함을 추구하는 플레인 츄러스",
                    font: .AppleSDGothicNeo(.medium, size: 16),
                    color: .gray_5!)
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.basic(text: "가격",
                    font: .AppleSDGothicNeo(.bold, size: 18),
                    color: .black)
        return label
    }()
    
    private let menuPrice: UILabel = {
        let label = UILabel()
         label.basic(text: "0원",
                     font: .AppleSDGothicNeo(.bold, size: 18),
                     color: .black)
         return label
    }()
    
    private let numberLabel: UILabel = {
      let label = UILabel()
        label.basic(text: "수량",
                    font: .AppleSDGothicNeo(.bold, size: 18),
                    color: .black)
        return label
    }()
    
    private var menuCountButton =  MenuCountView()

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

extension MenuDetailView {
    func setStyle() {
        backgroundColor = .clear
        priceView.backgroundColor = .white
        numberView.backgroundColor = .white
    }
    
    func setLayout() {
        addSubviews(priceView, numberView)
        verticalStackView.addArrangedSubviews(menuNameLabel, menuDetailLabel)
        priceView.addSubviews(verticalStackView, priceLabel, menuPrice)
        numberView.addSubviews(numberLabel, menuCountButton)
        
        priceView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(168)
        }
        
        numberView.snp.makeConstraints {
            $0.top.equalTo(priceView.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.directionalHorizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(68)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-28)
        }
        
        menuPrice.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-28)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        menuCountButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-15)
            $0.size.equalTo(CGSize(width: 140, height: 42))
        }
    }
}
