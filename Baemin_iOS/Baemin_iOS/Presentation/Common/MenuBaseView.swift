//
//  MenuBaseView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuBaseView: UIView {
    
    // MARK: - UI Components
    
    var menuName: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.clipsToBounds = true
        label.font = .AppleSDGothicNeo(.bold, size: 16.0)
        return label
    }()
    
    var price: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.clipsToBounds = true
        label.font = .AppleSDGothicNeo(.bold, size: 16.0)
        return label
    }()
    
    var foodImg: UIImageView = {
        let food = UIImageView()
        food.makeCornerRound(radius: 10)
        food.image = .dummy.resized(toWidth: 94)
        food.sizeToFit()
        return food
    }()
    
    lazy var gold_divider: UIView = {
        var width = UIScreen.main.bounds.width
        let xPosition = CGFloat(0.0)
        let yPosition = self.bounds.size.height
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: 1.0)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.sub_8
        self.addSubview(view)
        return view
    }()
    
    private let cellView = UIView()
    
    
    // MARK: - init func

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods

    private func setView() {
        backgroundColor = .clear
        cellView.backgroundColor = .clear
        
        cellView.addSubviews(menuName, price, foodImg, gold_divider)
        addSubview(cellView)
        
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        menuName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(32)
            $0.trailing.equalTo(foodImg.snp.leading)
            $0.height.equalTo(25)
        }
        
        price.snp.makeConstraints {
            $0.top.equalTo(menuName.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(32)
            $0.trailing.equalTo(foodImg.snp.leading)
            $0.height.equalTo(25)
        }
        
        foodImg.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(96)
            $0.width.equalTo(96)
        }
        
        gold_divider.snp.makeConstraints {
            $0.top.equalTo(foodImg.snp.bottom).offset(14.29)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1.0)
        }
    }
}
