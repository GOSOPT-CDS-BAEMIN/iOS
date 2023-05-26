//
//  MenuView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuView: UIView {
    
    var firstView = MenuBaseView()
    var secondView = MenuBaseView()
    var thirdView = MenuBaseView()
    var fourthView = MenuBaseView()
    var fifthView = MenuBaseView()
    
    var flag: Int = 0
    
    var selectedIndex: Int = 0 {
        didSet {
            flag = selectedIndex
        }
    }
    
    // 더미데이터
    var menuItem: [MenuItem] = MenuItem.items
    
    private var totalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .clear
        stack.sizeToFit()
        return stack
    }()
    
    // 0. init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle() {
        backgroundColor = .clear
    }
    
    func setLayOut() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        addSubviews(firstView, secondView, thirdView, fourthView, fifthView)
                
        var idx = 0
        
        menuItem.forEach {
            switch idx {
            case 0:
                firstView.menuName.text = $0.name
                firstView.price.text = $0.price
                firstView.addGestureRecognizer(tapGesture)
            case 1:
                secondView.menuName.text = $0.name
                secondView.price.text = $0.price
                secondView.addGestureRecognizer(tapGesture)
            case 2:
                thirdView.menuName.text = $0.name
                thirdView.price.text = $0.price
                thirdView.addGestureRecognizer(tapGesture)
            case 3:
                fourthView.menuName.text = $0.name
                fourthView.price.text = $0.price
                fourthView.addGestureRecognizer(tapGesture)
            default:
                fifthView.menuName.text = $0.name
                fifthView.price.text = $0.price
                fifthView.addGestureRecognizer(tapGesture)
            }
            idx += 1
        }
        
        firstView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        fifthView.snp.makeConstraints {
            $0.top.equalTo(fourthView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    @objc
    func handleTap(sender: UITapGestureRecognizer) {
        selectedIndex = 1
        NotificationCenter.default.post(name: NSNotification.Name("gotoMenuDetailVC"), object: flag)
        print(flag)
    }
}
