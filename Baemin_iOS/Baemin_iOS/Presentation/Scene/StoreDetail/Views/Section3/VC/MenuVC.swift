//
//  MenuVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuVC: UIViewController {
    
    let descriptionView = MenuDescriptionView()
    
    private let famous: UIImageView = {
        let view = UIImageView()
        view.image = .famous
        view.sizeToFit()
        return view
    }()
    
    var firstView = MenuBaseView()
    var secondView = MenuBaseView()
    var thirdView = MenuBaseView()
    var fourthView = MenuBaseView()
    var fifthView = MenuBaseView()
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    var flag: Int = 0
    
    var selectedIndex: Int = 0 {
        didSet {
            flag = selectedIndex
        }
    }
    
    // 더미데이터
    var menuItem: [MenuItem] = MenuItem.items
    
    func setViews() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
                        
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
    }
    
    @objc
    func handleTap(sender: UITapGestureRecognizer) {
        selectedIndex = 1
        NotificationCenter.default.post(name: NSNotification.Name("gotoMenuDetailVC"), object: flag)
        print(flag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStyle()
        setViews()
        setLayOut()
    }
    
    func setStyle() {
        view.backgroundColor = .white
        
        self.button1.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button1.backgroundColor = .clear
        
        self.button2.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button2.backgroundColor = .clear

        self.button3.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button3.backgroundColor = .clear

        self.button4.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button4.backgroundColor = .clear

        self.button5.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button5.backgroundColor = .clear
    }
    
    func setLayOut() {
        
        view.addSubviews(descriptionView, famous, firstView, secondView, thirdView, fourthView, fifthView, button1, button2, button3, button4, button5)
        
        descriptionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(21)
            $0.height.equalTo(108)
        }
        
        famous.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(72)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        firstView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(famous.snp.bottom).offset(20)
        }
        
        button1.snp.makeConstraints {
            $0.edges.equalTo(firstView.snp.edges)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        button2.snp.makeConstraints {
            $0.edges.equalTo(secondView.snp.edges)
        }
        
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        button3.snp.makeConstraints {
            $0.edges.equalTo(thirdView.snp.edges)
        }
        
        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        button4.snp.makeConstraints {
            $0.edges.equalTo(fourthView.snp.edges)
        }
        
        fifthView.snp.makeConstraints {
            $0.top.equalTo(fourthView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        button5.snp.makeConstraints {
            $0.edges.equalTo(fifthView.snp.edges)
        }
    }
}
