//
//  ReviewCommentView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class ReviewTab: UIView {
    
    // MARK: - Properties

    var flag: Int = 0
    
    var selectedIndex: Int = 0 {
        didSet {
            flag = selectedIndex
        }
    }
    
    // MARK: - UI Components

    private let totalReview: UILabel = {
        let label = UILabel()
        label.text = "최근 리뷰 1,619개"
        label.font = .AppleSDGothicNeo(.bold, size: 20)
        label.sizeToFit()
        return label
    }()
    
    private let ownerReview: UILabel = {
        let label = UILabel()
        label.text = "사장님댓글 1,112개"
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.sizeToFit()
        return label
    }()
    
    private let cleanReview: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.clean_review, for: .normal)
        btn.sizeToFit()
        btn.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let filter: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.filter.resized(toWidth: 16), for: .normal)
        btn.sizeToFit()
        btn.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let filterText: UILabel = {
        let label = UILabel()
        label.text = "필터"
        label.font = .AppleSDGothicNeo(.regular, size: 14)
        label.sizeToFit()
        return label
    }()
    
    // MARK: - initalize func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
        setNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    func setLayOut() {
        
        addSubviews(totalReview, ownerReview, cleanReview, filter, filterText)
        
        totalReview.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        ownerReview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(totalReview.snp.bottom).offset(14)
            $0.height.equalTo(22)
        }
        
        cleanReview.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(ownerReview.snp.bottom).offset(20)
        }
        
        filter.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(cleanReview.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }
        
        filterText.snp.makeConstraints {
            $0.trailing.equalTo(filter.snp.leading).offset(-5)
            $0.top.equalTo(cleanReview.snp.bottom).offset(16)
            $0.width.height.equalTo(26)
        }
    }
    
    @objc
    func filterTouched(_ sender: Any) {
        selectedIndex = 1
        
        NotificationCenter.default.post(name: NSNotification.Name("popUp"), object: flag)
    }
    
    func setNotification() {
        filter.addTarget(self, action: #selector(filterTouched), for: .touchUpInside)
    }
}


