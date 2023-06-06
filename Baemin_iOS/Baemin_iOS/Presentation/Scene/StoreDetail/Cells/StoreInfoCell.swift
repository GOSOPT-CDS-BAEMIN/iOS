//
//  StoreInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/20.
//

import UIKit

import SnapKit

class StoreInfoCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let reiviewCommentView = ReviewCommentView()
    private let optionSelectView = OptionSelectView()
    
    // MARK: - UI Components
    
    private var storeImage = UIImageView()
    
    private lazy var emptyImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.empty_2.resized(toWidth: UIScreen.main.bounds.width)
        img.contentMode = .scaleAspectFill
        img.sizeToFit()
        return img
    }()
    
    private var storeName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.text = "산시 도삭면"
        name.font = UIFont.AppleSDGothicNeo(.bold, size: 20.0)
        name.sizeToFit()
        return name
    }()
    
    private let storeRateImage: UIImageView = {
        let rate = UIImageView()
        rate.image = .five_star.resized(toWidth: 137)
        rate.sizeToFit()
        rate.contentMode = .scaleAspectFit
        return rate
    }()

    private let storeRate: UILabel = {
        let number = UILabel()
        number.text = "4.7"
        number.font = UIFont.AppleSDGothicNeo(.regular, size: 14.0)
        number.sizeToFit()
        return number
    }()
    
    private let couponBtn: UIButton = {
        let coupon = UIButton()
        coupon.setImage(UIImage.get_coupon.resized(toWidth: 342), for: .normal)
        coupon.sizeToFit()
        return coupon
    }()
    
    // MARK: - init func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func bind(_ storeData: StoreInfo) {

        if storeData.firstImageURL == "" {
            storeImage = emptyImage
        } else {
            storeImage.getImageFromURL(storeData.firstImageURL)
        }

        storeName.text = storeData.storeName
        storeRate.text = "\(storeData.rate)"
        isCoupon(storeData.couponExist)
        ratingStarImg(storeData.rate)
    }

    private func setLayOut() {
        
        addSubviewsInContentView(storeImage, storeName, storeRateImage, storeRate, reiviewCommentView, optionSelectView, couponBtn)
        
        storeImage.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }

        storeName.snp.makeConstraints {
            $0.top.equalTo(storeImage.snp.bottom).offset(30)
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
    
    func isCoupon(_ have: Bool) {
        if !have {
            couponBtn.isHidden = true
        }
    }
    
    func ratingStarImg(_ rating: Double) {
        if rating == 5.0 {
            storeRateImage.image = .five_zero.resized(toWidth: 137)
        } else if rating < 5.0 && rating >= 4.5 {
            storeRateImage.image = .five_star.resized(toWidth: 137)
        } else if rating < 4.5 && rating >= 4.0 {
            storeRateImage.image = .four_zero.resized(toWidth: 137)
        } else if rating < 4.0 && rating >= 3.5 {
            storeRateImage.image = .three_five.resized(toWidth: 137)
        } else if rating < 3.5 && rating >= 3.0 {
            storeRateImage.image = .three_zero.resized(toWidth: 137)
        } else if rating < 3.0 && rating >= 2.5 {
            storeRateImage.image = .two_five.resized(toWidth: 137)
        } else if rating < 2.5 && rating >= 2.0 {
            storeRateImage.image = .two_zero.resized(toWidth: 137)
        } else if rating < 2.0 && rating >= 1.5 {
            storeRateImage.image = .one_five.resized(toWidth: 137)
        } else if rating < 1.5 && rating >= 1.0 {
            storeRateImage.image = .one_zero.resized(toWidth: 137)
        } else if rating < 1.0 && rating >= 0.5 {
            storeRateImage.image = .zero_five.resized(toWidth: 137)
        } else if rating < 0.5 && rating >= 0.0 {
            storeRateImage.image = .zero_zero.resized(toWidth: 137)
        }
    }
}
