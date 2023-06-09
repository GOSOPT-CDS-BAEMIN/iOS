////
////  RenewalVC.swift
////  Baemin_iOS
////
////  Created by 김응관 on 2023/05/30.
////
//
// import UIKit
//
// import SnapKit
//
// class RenewalVC: UIViewController {
//    
//    private let navigationBar = CustomNavigaionView(type1: .store(.leftButton), type2: .store(.rightButton))
//    
//    var index: Int = 0
//    var isCoupon: Bool = true
//    
//    private lazy var safeArea = self.view.safeAreaLayoutGuide
//    private lazy var scrollLayOut = self.scrollView.contentLayoutGuide
//    private var contentView = UIView()
//    
//    private let stickyHead: UIView = StickyHeaderView()
//    private let storeInfoView: UIView = StoreInfoView()
//    private let storeRateView: UIView = StoreRateView()
//    private let reviewCommentView: UIView = ReviewCommentView()
//    private let optionSelectView: UIView = OptionSelectView()
//    private let deliveryView: UIView = DeliveryView()
//    private let pickUpView: UIView = PickUpView()
//    private let orderMethodSelectView: UIView = OrderMethodSelectView()
//    private let stickyTargetView: UIView = StickyTargetHeader()
//    private let detailView: UIView = DetailInfoCell()
//    private let deliveryView2: UIView = DeliveryView()
//    
//    // MARK: - Components
//    
//    private let scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.backgroundColor = .clear
//        scroll.isScrollEnabled = true
//        scroll.contentInsetAdjustmentBehavior = .never
//        scroll.layoutIfNeeded()
//        return scroll
//    }()
//    
//    private let couponBtn: UIButton = {
//        let coupon = UIButton()
//        coupon.setImage(UIImage.get_coupon.resized(toWidth: 342), for: .normal)
//        coupon.sizeToFit()
//        return coupon
//    }()
//    
//    private let couponStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.alignment = .center
//        stack.spacing = 18
//        return stack
//    }()
//    
//    private var orderMethodStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.backgroundColor = .white
//        stack.alignment = .center
//        stack.sizeToFit()
//        return stack
//    }()
//    
//    // MARK: - Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setStyle()
//        setLayOut()
//        setNotificationCenter()
//        viewDidLayoutSubviews()
//    }
//    
//    // MARK: - Methods
//
//    private func setStyle() {
//        view.backgroundColor = .white
//        stickyHead.isHidden = true
//        pickUpView.isHidden = true
//                
//        navigationBar.backButton.leftButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        
//        navigationBar.iconButton.rightButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
//        
//        haveCoupon()
//        
//    }
//    
//    private func setNotificationCenter() {
//        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("orderIndex"), object: nil)
//    }
//    
//    private func setLayOut() {
//
//        view.addSubviews(scrollView, navigationBar, stickyHead)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        scrollView.addSubview(contentView)
//        
////        NSLayoutConstraint.activate([
////            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
////            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
////            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
////            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
////            contentView.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor)
////        ])
//                        
//        contentView.addSubviews(storeInfoView, storeRateView, reviewCommentView, couponStack, orderMethodSelectView, orderMethodStack, stickyTargetView, detailView, deliveryView2)
//        
//        couponStack.addArrangedSubviews(optionSelectView, couponBtn)
//        orderMethodStack.addArrangedSubviews(deliveryView, pickUpView)
//            
//        navigationBar.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(44)
//            $0.height.equalTo(44)
//            $0.directionalHorizontalEdges.equalTo(safeArea)
//        }
//
//        stickyHead.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalToSuperview().inset(97)
//            $0.height.equalTo(40)
//        }
//        
//        scrollView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        
//        contentView.snp.makeConstraints {
//            $0.edges.equalTo(scrollView.contentLayoutGuide)
//            $0.width.equalTo(scrollView.frameLayoutGuide)
//            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
//        }
//        
//        storeInfoView.snp.makeConstraints {
//            $0.top.horizontalEdges.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(270)
//        }
//        
//        storeRateView.snp.makeConstraints {
//            $0.top.equalTo(storeInfoView.snp.bottom).offset(30)
//            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
//            $0.height.equalTo(60)
//        }
//        
//        reviewCommentView.snp.makeConstraints {
//            $0.top.equalTo(storeRateView.snp.bottom).offset(8)
//            $0.centerY.equalToSuperview()
//            $0.height.equalTo(23)
//        }
//        
//        couponStack.snp.makeConstraints {
//            $0.top.equalTo(reviewCommentView.snp.bottom).offset(18)
//            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
//        }
//        
//        optionSelectView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.height.equalTo(22)
//            $0.centerX.equalToSuperview()
//        }
//        
//        couponBtn.snp.makeConstraints {
//            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(14)
//            $0.bottom.equalToSuperview()
//        }
//        
//        orderMethodSelectView.snp.makeConstraints {
//            $0.top.equalTo(couponStack.snp.bottom).offset(37)
//            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
//        }
//        
//        orderMethodStack.snp.makeConstraints {
//            $0.top.equalTo(orderMethodSelectView.snp.bottom).offset(30)
//            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
//        }
//
//        deliveryView.snp.makeConstraints {
//            $0.width.top.equalToSuperview()
//        }
//
//        pickUpView.snp.makeConstraints {
//            $0.top.equalTo(deliveryView.snp.bottom)
//            $0.width.equalToSuperview()
//            $0.bottom.equalToSuperview()
//        }
//        
//        deliveryView2.snp.makeConstraints {
//            $0.top.equalTo(orderMethodStack.snp.bottom).offset(60)
//            $0.horizontalEdges.equalToSuperview()
//            $0.bottom.equalToSuperview()
//        }
//        
////        stickyTargetView.snp.makeConstraints {
////            $0.top.equalTo(orderMethodStack.snp.bottom).offset(40)
////            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
////            $0.height.equalTo(42)
////        }
////
////        detailView.snp.makeConstraints {
////            $0.top.equalTo(stickyTargetView.snp.bottom)
////            $0.horizontalEdges.equalTo(contentView.snp.horizontalEdges)
////            $0.bottom.equalToSuperview()
////        }
//    }
//    
//    private func haveCoupon() {
//        if !isCoupon {
//            couponBtn.isHidden = true
//        }
//    }
//}
//
//extension RenewalVC {
//    @objc
//    func backButtonTapped() {
//        self.navigationController?
//            .popViewController(animated: true)
//        print("clicked")
//    }
//    
//    @objc
//    func cartButtonTapped() {
//        let vc = CartViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        print("clicked")
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
//extension UIScrollView {
//    func updateContentView() {
//        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
//    }
//}
