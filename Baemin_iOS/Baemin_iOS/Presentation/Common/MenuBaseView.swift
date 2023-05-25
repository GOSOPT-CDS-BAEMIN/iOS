//
//  MenuBaseView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuBaseView: UIView {
    
    var menuName: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = .AppleSDGothicNeo(.bold, size: 16.0)
        return label
    }()
    
    var price: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = .AppleSDGothicNeo(.bold, size: 16.0)
        return label
    }()
    
    var foodImg: UIImageView = {
        let food = UIImageView()
        food.makeCornerRound(radius: 3.81)
        food.image = .dummy.resized(toWidth: 94)
        food.sizeToFit()
        return food
    }()
    
    lazy var gold_divider: UIView = {
        var width = UIScreen.main.bounds.width
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: 1.0)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.sub_8
        self.addSubview(view)
        return view
    }()
    
    private let infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.sizeToFit()
        return stackView
    }()
    
    private let textStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.sizeToFit()
        return stackView
    }()
    
    private func makeTextStack() {
        backgroundColor = .clear
        
        textStack.addArrangedSubviews(menuName, price)
        
        addSubview(textStack)
        
        textStack.setCustomSpacing(16.0, after: menuName)
        
        menuName.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(86)
        }
        
        price.snp.makeConstraints {
            $0.leading.equalTo(menuName.snp.leading)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(64)
        }
    }
    
    private func makeTotalStack() {
        backgroundColor = .clear
        
        infoStack.addArrangedSubviews(textStack, foodImg)
        
        addSubviews(infoStack, gold_divider)
        
        infoStack.setCustomSpacing(54.0, after: textStack)
        
        infoStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        textStack.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(38)
            $0.width.equalTo(162)
        }
        
        foodImg.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
        }
        
        gold_divider.snp.makeConstraints {
            $0.top.equalTo(infoStack.snp.bottom).offset(14.29)
            $0.leading.trailing.equalToSuperview().inset(15.5)
            $0.bottom.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
        makeTextStack()
        makeTotalStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
