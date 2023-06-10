//
//  StoreRateView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class StoreRateView: UIView {

    // MARK: - UI Components
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private let storeName: UILabel = {
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
        number.font = .AppleSDGothicNeo(.regular, size: 14)
        number.sizeToFit()
        return number
    }()
    
    // MARK: - init func
    
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
    
    // MARK: - Methods

    private func setLayOut() {
        
        addSubviews(storeName, storeRateImage, storeRate)
        
        storeName.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        storeRateImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(102)
            $0.width.equalTo(137)
            $0.top.equalTo(storeName.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
        }
        
        storeRate.snp.makeConstraints {
            $0.centerY.equalTo(storeRateImage.snp.centerY)
            $0.leading.equalTo(storeRateImage.snp.trailing).offset(4)
            $0.bottom.equalToSuperview()
        }
    }
}
