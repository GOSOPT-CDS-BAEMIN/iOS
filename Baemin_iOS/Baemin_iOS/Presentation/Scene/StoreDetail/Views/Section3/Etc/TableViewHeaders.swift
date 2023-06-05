//
//  TableViewHeaders.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class TableViewHeaders: UIView {
    
    var foodImg: String?

    var storeInfoView = StoreInfoView(frame: .zero, imgURL: "")
    let storeRateView = StoreRateView()
    let reviewCommentView = ReviewCommentView()
    let optionSelectView = OptionSelectView()
    let orderMethodSelect = OrderMethodSelect()
    let orderInfoView = OrderInfoView()
    
    private var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.alignment = .center
        stackView.sizeToFit()
        stackView.insetsLayoutMarginsFromSafeArea = false
        return stackView
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
    
    func bind() {
        
        guard let img = foodImg else {
            storeInfoView = StoreInfoView(frame: .zero, imgURL: "")
            return
        }
        
        storeInfoView = StoreInfoView(frame: .zero, imgURL: img)
    }
    
    func setLayOut() {
        
        addSubview(stack)
        stack.addArrangedSubviews(storeInfoView, storeRateView, reviewCommentView, optionSelectView, orderMethodSelect, orderInfoView)
        
        stack.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        storeInfoView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(264)
            $0.top.equalToSuperview()
        }
        
        stack.setCustomSpacing(30.0, after: storeInfoView)
        
        storeRateView.snp.makeConstraints {
            $0.top.equalTo(storeInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        reviewCommentView.snp.makeConstraints {
            $0.top.equalTo(storeRateView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        optionSelectView.snp.makeConstraints {
            $0.top.equalTo(reviewCommentView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        orderMethodSelect.snp.makeConstraints {
            $0.top.equalTo(optionSelectView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        orderInfoView.snp.makeConstraints {
            $0.top.equalTo(orderMethodSelect.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {
        backgroundColor = .clear
    }
}
