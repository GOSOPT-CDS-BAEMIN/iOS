//
//  RenewalVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/30.
//

import UIKit

import SnapKit

class RenewalVC: UIViewController {
    
    private let navigationBar = CustomNavigaionView(type1: .store(.leftButton), type2: .store(.rightButton))
    
    var index: Int = 0
    var isCoupon: Bool = true
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let stickyHead: UIView = StickyHeaderView()
    private let storeInfoView: UIView = StoreInfoView()
    private let storeRateView: UIView = StoreRateView()
    private let reviewCommentView: UIView = ReviewCommentView()
    private let optionSelectView: UIView = OptionSelectView()
    private let deliveryView: UIView = DeliveryView()
    private let pickUpView: UIView = PickUpView()
    private let orderMethodSelectView: UIView = OrderMethodSelectView()
    
    // MARK: - Components
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isScrollEnabled = true
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.sizeToFit()
        return scroll
    }()
    
    private let couponBtn: UIButton = {
        let coupon = UIButton()
        coupon.setImage(UIImage.get_coupon.resized(toWidth: 342), for: .normal)
        coupon.sizeToFit()
        return coupon
    }()
    
    private let couponStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 18
        return stack
    }()
    
    private var orderMethodStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.alignment = .center
        stack.sizeToFit()
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
        setNotificationCenter()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        stickyHead.isHidden = true
        pickUpView.isHidden = true
        
        navigationBar.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        navigationBar.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        
        haveCoupon()
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("orderIndex"), object: nil)
    }
    
    private func setLayOut() {

        view.addSubviews(scrollView, navigationBar, stickyHead)
        
        scrollView.addSubviews(storeInfoView, storeRateView, reviewCommentView, couponStack, orderMethodSelectView, orderMethodStack)
        
        couponStack.addArrangedSubviews(optionSelectView, couponBtn)
        orderMethodStack.addArrangedSubviews(deliveryView, pickUpView)
            
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.height.equalTo(44)
            $0.directionalHorizontalEdges.equalTo(safeArea)
        }

        stickyHead.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(97)
            $0.height.equalTo(40)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        storeInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(270)
        }
        
        storeRateView.snp.makeConstraints {
            $0.top.equalTo(storeInfoView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        reviewCommentView.snp.makeConstraints {
            $0.top.equalTo(storeRateView.snp.bottom).offset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(23)
        }
        
        couponStack.snp.makeConstraints {
            $0.top.equalTo(reviewCommentView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
        }
        
        optionSelectView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(22)
            $0.centerX.equalToSuperview()
        }
        
        couponBtn.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview()
        }
        
        orderMethodSelectView.snp.makeConstraints {
            $0.top.equalTo(couponStack.snp.bottom).offset(37)
            $0.horizontalEdges.equalToSuperview()
        }
        
        orderMethodStack.snp.makeConstraints {
            $0.top.equalTo(orderMethodSelectView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }

        deliveryView.snp.makeConstraints {
            $0.width.top.equalToSuperview()
        }

        pickUpView.snp.makeConstraints {
            $0.top.equalTo(deliveryView.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func haveCoupon() {
        if !isCoupon {
            couponBtn.isHidden = true
        }
    }
}

extension RenewalVC {
    @objc
    func backButtonTapped() {
        self.navigationController?
            .popViewController(animated: true)
        print("clicked")
    }
    
    @objc
    func cartButtonTapped() {
        let vc = CartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("clicked")
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
