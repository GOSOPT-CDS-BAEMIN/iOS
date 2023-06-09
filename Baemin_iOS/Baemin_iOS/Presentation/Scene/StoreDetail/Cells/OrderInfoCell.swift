//
//  OrderInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class OrderInfoCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let first_label: [String] = ["최소주문금액", "결제방법", "배달시간", "배달팁"]
    private let second_label: [String] = ["8,000원", "바로결제, 만나서결제", "18~33분 소요 예상", "0원 ~ 2,000원"]
    
    private let firstView = DeliveryInfoBaseView()
    private let secondView = DeliveryInfoBaseView()
    private let thirdView = DeliveryInfoBaseView()
    private let fourthView = DeliveryInfoBaseView()
    var pickUpView = PickUpView()
    
    var minOrderPrice: Int = 0
    var deliveryTime: String = ""
    
    // MARK: - UI Component
    
    private let detailTag: UIButton = {
        let tag = UIButton()
        tag.setImage(UIImage.detail.resized(toWidth: 44), for: .normal)
        tag.sizeToFit()
        return tag
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .clear
        stack.alignment = .center
        stack.sizeToFit()
        return stack
    }()
    
    private var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .center
        stack.sizeToFit()
        stack.spacing = 12
        return stack
    }()
    
    // MARK: - init func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayOut()
        setStyle()
        setNotificationCenter()
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func bind(_ data: StoreInfo) {
        firstView.rightView.text = "\(data.minOrderPrice)원"
        thirdView.rightView.text = data.deliveryTime
    }
    
    func setStyle() {
        contentView.backgroundColor = .white
        pickUpView.isHidden = true
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("orderIndex"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int
        
        if tmp == 0 {
            infoStack.isHidden = false
            pickUpView.isHidden = true
        } else {
            infoStack.isHidden = true
            pickUpView.isHidden = false
        }
    }
    
    private func setting() {
        firstView.leftView.text = first_label[0]
        firstView.rightView.text = String(describing: minOrderPrice)
        secondView.leftView.text = first_label[1]
        secondView.rightView.text = second_label[1]
        thirdView.leftView.text = first_label[2]
        thirdView.rightView.text = String(describing: deliveryTime)
        fourthView.leftView.text = first_label[3]
        fourthView.rightView.text = second_label[3]
    }
    
    private func setLayOut() {
        
        backgroundColor = .clear
        
        infoStack.addArrangedSubviews(firstView, secondView, thirdView, fourthView, detailTag)
        
        stackView.addArrangedSubviews(infoStack, pickUpView)
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        infoStack.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        secondView.snp.makeConstraints {
            $0.leading.equalTo(firstView.snp.leading)
        }
        
        thirdView.snp.makeConstraints {
            $0.leading.equalTo(firstView.snp.leading)
        }
        
        fourthView.snp.makeConstraints {
            $0.leading.equalTo(firstView.snp.leading)
        }
        
        detailTag.snp.makeConstraints {
            $0.leading.equalTo(fourthView.snp.trailing).offset(6)
        }
        
        pickUpView.snp.makeConstraints {
            $0.top.equalTo(infoStack.snp.bottom)
            $0.width.bottom.equalToSuperview()
        }
    }
}
