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
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let stickyHead: UIView = StickyHeaderView()
    private let storeInfoView: UIView = StoreInfoView()
    private let storeRateView: UIView = StoreRateView()
    private let reviewCommentView: UIView = ReviewCommentView()
    
    // MARK: - Components
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isScrollEnabled = true
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.sizeToFit()
        return scroll
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
        
        self.view.sendSubviewToBack(storeInfoView)
    }
    
    private func setLayOut() {

        view.addSubviews(scrollView, navigationBar, stickyHead)
        
        scrollView.addSubviews(storeInfoView, storeRateView, reviewCommentView)
        
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
