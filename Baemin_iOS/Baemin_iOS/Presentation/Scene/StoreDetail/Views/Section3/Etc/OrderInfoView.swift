////
////  OrderInfoView.swift
////  Baemin_iOS
////
////  Created by 김응관 on 2023/05/26.
////
//
//import UIKit
//
//import SnapKit
//
//class OrderInfoView: UIView {
//
//    let deliveryView = DeliveryView()
//    let pickUpView = PickUpView()
//
//    // 0. init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setLayOut()
//        setStyle()
//        setNotificationCenter()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private var stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.backgroundColor = .white
//        stack.alignment = .center
//        stack.sizeToFit()
//        return stack
//    }()
//
//    func setStyle() {
//        //contentView.backgroundColor = .white
//        backgroundColor = .white
//        pickUpView.isHidden = true
//    }
//
//    func setNotificationCenter() {
//        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("orderIndex"), object: nil)
//    }
//
//    func setLayOut() {
//
//        stackView.addArrangedSubviews(deliveryView, pickUpView)
//
//        addSubview(stackView)
//
//        stackView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(30)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//
//        deliveryView.snp.makeConstraints {
//            $0.width.top.equalToSuperview()
//        }
//
//        pickUpView.snp.makeConstraints {
//            $0.top.equalTo(deliveryView.snp.bottom)
//            $0.width.bottom.equalToSuperview()
//        }
//
//    }
//
//    @objc func dataReceived(_ notification: Notification) {
//        let tmp = notification.object as! Int
//
//        if tmp == 0 {
//            deliveryView.isHidden = false
//            pickUpView.isHidden = true
//        } else {
//            deliveryView.isHidden = true
//            pickUpView.isHidden = false
//        }
//    }
//}
//
