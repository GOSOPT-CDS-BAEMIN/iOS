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
    
    let deliveryView = DeliveryView()
    let pickUpView = PickUpView()
    
    // MARK: - init func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayOut()
        setStyle()
        setNotificationCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .center
        stack.sizeToFit()
        return stack
    }()
    
    // MARK: - Methods
    
    func setStyle() {
        contentView.backgroundColor = .white
        pickUpView.isHidden = true
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("orderIndex"), object: nil)
    }
    
    func setLayOut() {
        
        stackView.addArrangedSubviews(deliveryView, pickUpView)
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        deliveryView.snp.makeConstraints {
            $0.width.top.equalToSuperview()
        }
        
        pickUpView.snp.makeConstraints {
            $0.top.equalTo(deliveryView.snp.bottom)
            $0.width.bottom.equalToSuperview()
        }
        
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int

        if tmp == 0 {
            deliveryView.isHidden = false
            pickUpView.isHidden = true
        } else {
            deliveryView.isHidden = true
            pickUpView.isHidden = false
        }
    }
}
