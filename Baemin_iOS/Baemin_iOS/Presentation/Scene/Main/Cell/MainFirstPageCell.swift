//
//  MainFirstPageCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import UIKit

import SnapKit
import Kingfisher

class MainFirstPageCell: UICollectionViewCell {
    
    // MARK: - Components
    var firstItems: [StoreInfo] = StoreInfo.item

    // MARK: - UI Components
    
    private let hImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.makeCornerRound(radius: 4)
        stackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        return stackView
    }()
    
    private let vImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let hPriceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let mainImage = UIImageView()
    private let subImage1 = UIImageView()
    private let subImage2 = UIImageView()
    
    private let storeName: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()
    
    private let deliveryTime: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.regular, size: 14)
        return label
    }()
    
    private let minimumLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Main.minimum
        label.font = .AppleSDGothicNeo(.regular, size: 14)
        label.textColor = .gray_5
        return label
    }()
    
    private let minimumPrice: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.regular, size: 14)
        label.textColor = .black
        return label
    }()
    
    private let coupon: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .black
        label.makeCornerRound(radius: 5)
        label.backgroundColor = .gray_7
        label.font = .AppleSDGothicNeo(.regular, size: 10)
        label.clipsToBounds = true
        label.text = I18N.Main.packing
        label.isHidden = true
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MainFirstPageCell {
    private func setStyle() {
        layer.applyShadow(color: .black.withAlphaComponent(0.08), alpha: 1.0, x: 2, y: 4, blur: 6)
        contentView.backgroundColor = .white
        contentView.makeCornerRound(radius: 12)
        contentView.clipsToBounds = true

    }
    
    private func setLayout() {
        contentView.addSubviews(hImageStackView, storeName, deliveryTime, hPriceStackView)
        hImageStackView.addArrangedSubviews(mainImage, vImageStackView)
        vImageStackView.addArrangedSubviews(subImage1, subImage2)
        hPriceStackView.addArrangedSubviews(minimumLabel, minimumPrice, coupon)
        
        mainImage.snp.makeConstraints {
            $0.height.equalTo(160)
            $0.width.equalTo(267)
        }
        
        [subImage1, subImage2].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(80)
            }
        }
        
        vImageStackView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(160)
        }
        
        hImageStackView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(160)
        }
        
        storeName.snp.makeConstraints {
            $0.top.equalTo(hImageStackView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(14)
        }
        
        deliveryTime.snp.makeConstraints {
            $0.top.equalTo(storeName.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(14)
        }
        
        hPriceStackView.snp.makeConstraints {
            $0.top.equalTo(deliveryTime.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(14)
            $0.width.equalTo(155)
            $0.bottom.equalToSuperview().offset(-14)
        }
    }
    
    func bind(_ item: StoreInfo) {
        
        //if let imageURL = item.firstImageURL {
            mainImage.getImageFromURL(item.firstImageURL)
     //   }
        mainImage.kf.setImage(with: URL(string: item.firstImageURL ?? ""))
      //  mainImage.image = UIImage(named: item.firstImageURL)
        subImage1.image = UIImage(named: item.secondImageURL)
        subImage2.image = UIImage(named: item.thirdImageURL)

        storeName.attributedText = NSMutableAttributedString()
            .addImageInBetweenString(firstSentence: item.storeName, image: .yellow_star, lastSentence: "\(item.rate)")
            .withLineSpacing(3)
        deliveryTime.text = I18N.Main.delivery+"\(item.deliveryTime)"
        minimumPrice.text = "\(item.minOrderPrice)원"
        if item.couponExist == true {
            coupon.isHidden = false
        }
    }
}
