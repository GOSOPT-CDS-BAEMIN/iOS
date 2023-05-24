//
//  StoreInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/20.
//

import UIKit

import SnapKit

class StoreInfoCell: UITableViewCell {
    
    private let storeInfoView = StoreInfoView()
    private let reiviewCommentView = ReviewCommentView()
    private let optionSelectView = OptionSelectView()
    
    // MARK: 2. 가게이름 - API 항목 storeName 추후 반영필요
    private let storeName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "산시 도삭면"
        name.font = UIFont.AppleSDGothicNeo(.bold, size: 20.0)
        name.sizeToFit()
        return name
    }()
    
    // MARK: 3. 가게별점 이미지 - API 항목 storeRate에 따른 이미지 변화 필요
    private let storeRateImage: UIImageView = {
        let rate = UIImageView()
        rate.image = .five_star.resized(toWidth: 137)
        rate.sizeToFit()
        rate.contentMode = .scaleAspectFit
        return rate
    }()

    // MARK: 4. 가게별점 - API 항목 storeRate 데이터 반영 필요
    private let storeRate: UILabel = {
        let number = UILabel()
        number.text = "4.7"
        number.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        number.sizeToFit()
        return number
    }()
    
    // 5. 5000원 쿠폰 버튼
    private let couponBtn: UIButton = {
        let coupon = UIButton()
        coupon.setImage(UIImage.get_coupon.resized(toWidth: 342), for: .normal)
        coupon.sizeToFit()
        return coupon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayOut() {
        
        addSubviewsInContentView(storeInfoView, storeName, storeRateImage, storeRate, reiviewCommentView, optionSelectView, couponBtn)
        
        storeInfoView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(-22)
        }

        storeName.snp.makeConstraints {
            $0.top.equalTo(storeInfoView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        storeRateImage.snp.makeConstraints {
            $0.top.equalTo(storeName.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(122)
        }
        
        storeRate.snp.makeConstraints {
            $0.leading.equalTo(storeRateImage.snp.trailing).offset(4)
            $0.centerY.equalTo(storeRateImage.snp.centerY)
        }
        
        reiviewCommentView.snp.makeConstraints {
            $0.top.equalTo(storeRateImage.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        optionSelectView.snp.makeConstraints {
            $0.top.equalTo(reiviewCommentView.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        couponBtn.snp.makeConstraints {
            $0.top.equalTo(optionSelectView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    func isCoupon(_ have: Int) {
        if have == 0 {
            couponBtn.isHidden = true
        }
    }
}
