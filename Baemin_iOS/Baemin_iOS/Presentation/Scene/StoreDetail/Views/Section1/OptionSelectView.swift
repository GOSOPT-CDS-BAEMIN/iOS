//
//  OptionSelectView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class OptionSelectView: UIView {
    
    
    // MARK: - UI Components
    private let callBtn: UIButton = {
        let call = UIButton()
        call.setImage(UIImage(systemName: "phone")?.resized(toWidth: 18), for: .normal)
        call.tintColor = .black
        call.sizeToFit()
        return call
    }()
    
    // 2. 전화 label
    private let callLabel: UILabel = {
        let call = UILabel()
        call.text = I18N.StoreDetail.call
        call.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        call.sizeToFit()
        return call
    }()
    
    // 3. divider bar
    private let divider: UIImageView = {
        let bar = UIImageView()
        bar.contentMode = .scaleAspectFit
        bar.image = .vertical_bar
        return bar
    }()
    
    // 4. 하트 버튼
    private let heartBtn: UIButton = {
        let heart = UIButton()
        heart.setImage(UIImage.like_heart.resized(toWidth: 18), for: .normal)
        heart.sizeToFit()
        return heart
    }()
    
    // 5. 좋아요 개수
    private let heartNum: UILabel = {
        let like = UILabel()
        like.text = "413"
        like.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        like.sizeToFit()
        return like
    }()
    
    // 3. divider bar
    private let divider2: UIImageView = {
        let bar = UIImageView()
        bar.contentMode = .scaleAspectFit
        bar.image = .vertical_bar
        return bar
    }()
    
    // 6. 공유 버튼
    private let shareBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.share.resized(toWidth: 12), for: .normal)
        button.sizeToFit()
        return button
    }()
    
    // 7. 공유 라벨
    private let shareLabel: UILabel = {
        let share = UILabel()
        share.text = I18N.StoreDetail.share
        share.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        share.sizeToFit()
        return share
    }()
    
    // 3. divider bar
    private let divider3: UIImageView = {
        let bar = UIImageView()
        bar.contentMode = .scaleAspectFit
        bar.image = .vertical_bar
        return bar
    }()
    
    // 8. 함께 주문 버튼
    private let withBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.person_add.resized(toWidth: 18), for: .normal)
        button.sizeToFit()
        return button
    }()
    
    // 9. 함께주문 라벨
    private let withLabel: UILabel = {
        let with = UILabel()
        with.text = I18N.StoreDetail.orderTogether
        with.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        with.sizeToFit()
        return with
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
        
        addSubviews(callBtn, callLabel, divider, heartBtn, heartNum, divider2, shareBtn, shareLabel, divider3, withBtn, withLabel)
        
        callBtn.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(1.5)
            $0.bottom.equalToSuperview().inset(1.5)
        }
        
        callLabel.snp.makeConstraints {
            $0.leading.equalTo(callBtn.snp.trailing).offset(6)
            $0.top.equalTo(callBtn.snp.top).inset(1.5)
            $0.bottom.equalTo(callBtn.snp.bottom).inset(3.0)
        }
        
        divider.snp.makeConstraints {
            $0.leading.equalTo(callLabel.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(2.0)
            $0.bottom.equalToSuperview().inset(2.0)
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        heartBtn.snp.makeConstraints {
            $0.leading.equalTo(divider.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(0.5)
        }
    
        heartNum.snp.makeConstraints {
            $0.leading.equalTo(heartBtn.snp.trailing).offset(6)
            $0.centerY.equalTo(callBtn.snp.centerY)
            $0.top.equalToSuperview().inset(1.5)
            $0.bottom.equalToSuperview().inset(1.5)
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        divider2.snp.makeConstraints {
            $0.leading.equalTo(heartNum.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(2.0)
            $0.bottom.equalToSuperview().inset(2.0)
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        shareBtn.snp.makeConstraints {
            $0.leading.equalTo(divider2.snp.trailing).offset(14)
            $0.top.bottom.equalToSuperview()
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        shareLabel.snp.makeConstraints {
            $0.leading.equalTo(shareBtn.snp.trailing).offset(6)
            $0.centerY.equalTo(callBtn.snp.centerY)
            $0.top.equalToSuperview().inset(1.5)
            $0.bottom.equalToSuperview().inset(1.5)
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        divider3.snp.makeConstraints {
            $0.leading.equalTo(shareLabel.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(2.0)
            $0.bottom.equalToSuperview().inset(2.0)
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        withBtn.snp.makeConstraints {
            $0.leading.equalTo(divider3.snp.trailing).offset(14)
            $0.top.bottom.equalToSuperview()
            $0.centerY.equalTo(callBtn.snp.centerY)
        }
        
        withLabel.snp.makeConstraints {
            $0.leading.equalTo(withBtn.snp.trailing).offset(6)
            $0.centerY.equalTo(callBtn.snp.centerY)
            $0.top.equalToSuperview().inset(1.5)
            $0.bottom.equalToSuperview().inset(1.5)
            $0.centerY.equalTo(callBtn.snp.centerY)
            $0.trailing.equalToSuperview()
        }
    }
}
