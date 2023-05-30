//
//  RenewalVC.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/30.
//

import UIKit

import SnapKit

class RenewalVC: UIViewController, UIGestureRecognizerDelegate {
    
    private let navigationBar = CustomNavigaionView(type1: .store(.leftButton), type2: .store(.rightButton))
    
    var index: Int = 0
    var isCoupon: Bool = true
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let stickyHead: UIView = StickyHeaderView()
    private let storeInfoView: UIView = StoreInfoView()
    private let storeRateView: UIView = StoreRateView()
    private let reviewCommentView: UIView = ReviewCommentView()
    private let optionSelectView: UIView = OptionSelectView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        stickyHead.isHidden = true
        
        navigationBar.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        navigationBar.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        
        haveCoupon()
    }
    
    private func setLayOut() {

        view.addSubviews(scrollView, navigationBar, stickyHead)
        
        scrollView.addSubviews(storeInfoView, storeRateView, reviewCommentView, couponStack)
        
        couponStack.addArrangedSubviews(optionSelectView, couponBtn)
            
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
}
