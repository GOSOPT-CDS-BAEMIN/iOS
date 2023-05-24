//
//  StoreRateView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit
import SnapKit

class StoreRateView: UIView {

    // 0. UI Component 전체를 담을 StackView 선언
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: 1. 가게별점 이미지 - API 항목 storeRate에 따른 이미지 변화 필요
    private let storeRateImage: UIImageView = {
        let rate = UIImageView()
        rate.image = .five_star.resized(toWidth: 137)
        rate.sizeToFit()
        rate.contentMode = .scaleAspectFit
        return rate
    }()

    // MARK: 2. 가게별점 - API 항목 storeRate 데이터 반영 필요
    private let storeRate: UILabel = {
        let number = UILabel()
        number.text = "4.7"
        number.font = .AppleSDGothicNeo(.regular, size: 14)
        number.sizeToFit()
        return number
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        setLayOut()
    }
    
    private func setLayOut() {
//        [storeRateImage, storeRate].forEach {
//            addSubview($0)
//        }
        
        addSubviews(storeRateImage, storeRate)
        
        storeRateImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(102)
            $0.width.equalTo(137)
            $0.top.equalToSuperview()
        }
        
        storeRate.snp.makeConstraints {
            $0.centerY.equalTo(storeRateImage.snp.centerY)
            $0.leading.equalTo(storeRateImage.snp.trailing).offset(4)
        }
    }
}
