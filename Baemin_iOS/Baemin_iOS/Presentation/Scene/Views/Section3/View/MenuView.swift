//
//  MenuView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuView: UIView {
    
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
        
        addSubview(totalStack)
        
        menuItem.forEach {
            let baseView = MenuBaseView()
            baseView.menuName.text = $0.name
            baseView.price.text = $0.price
            
            totalStack.addArrangedSubview(baseView)
            baseView.addGestureRecognizer(tapGesture)
        }
        
        totalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc
    func handleTap(sender: UITapGestureRecognizer) {
        selectedIndex = 1
        NotificationCenter.default.post(name: NSNotification.Name("gotoMenuDetailVC"), object: flag)
        print(flag)
    }
}
