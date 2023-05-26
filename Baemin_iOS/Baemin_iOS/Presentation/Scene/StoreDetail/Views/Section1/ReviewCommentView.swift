//
//  ReviewCommnetView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class ReviewCommentView: UIView {
     
    // MARK: - UI Components

    // 1. 최근 리뷰 label
    private let recentReview: UILabel = {
        let review = UILabel()
        review.textColor = .black
        review.text = I18N.StoreDetail.recentReview
        review.translatesAutoresizingMaskIntoConstraints = false
        review.font = UIFont.AppleSDGothicNeo(.regular, size: 16.0)
        review.sizeToFit()
        review.textColor = UIColor.gray_5
        return review
    }()
    
    // 2. 리뷰 개수 label
    private let reviewNum: UILabel = {
        let num = UILabel()
        num.textColor = .black
        num.text = "109 "
        num.translatesAutoresizingMaskIntoConstraints = false
        num.font = UIFont.AppleSDGothicNeo(.regular, size: 16.0)
        num.sizeToFit()
        num.textColor = UIColor.gray_5
        return num
    }()
    
    // 3. 최근 리뷰 label
    private let recentComment: UILabel = {
        let review = UILabel()
        review.textColor = .black
        review.text = I18N.StoreDetail.ownerComment
        review.translatesAutoresizingMaskIntoConstraints = false
        review.font = UIFont.AppleSDGothicNeo(.regular, size: 16.0)
        review.sizeToFit()
        review.textColor = UIColor.gray_5
        return review
    }()
    
    // 4. 리뷰 개수 label
    private let commentNum: UILabel = {
        let num = UILabel()
        num.textColor = .black
        num.text = "112 "
        num.translatesAutoresizingMaskIntoConstraints = false
        num.font = UIFont.AppleSDGothicNeo(.regular, size: 16.0)
        num.sizeToFit()
        num.textColor = UIColor.gray_5
        return num
    }()
    
    private let divider: UIImageView = {
        let bar = UIImageView()
        bar.contentMode = .scaleAspectFit
        bar.image = .review_bar
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    // MARK: - init func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayOut()
    }
    
    // MARK: - Methods 
    
    private func setLayOut() {
        [recentReview, reviewNum, divider, recentComment, commentNum].forEach {
            addSubview($0)
        }
        
        recentReview.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        reviewNum.snp.makeConstraints {
            $0.leading.equalTo(recentReview.snp.trailing)
            $0.top.bottom.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.leading.equalTo(reviewNum.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
            $0.bottom.equalToSuperview().inset(5)
            $0.top.equalToSuperview().inset(5)
        }
        
        recentComment.snp.makeConstraints {
            $0.leading.equalTo(divider.snp.trailing).offset(8)
            $0.top.bottom.equalToSuperview()
        }
        
        commentNum.snp.makeConstraints {
            $0.leading.equalTo(recentComment.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
