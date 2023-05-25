//
//  MainOptionCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import UIKit

import SnapKit

class MainOptionCell: UICollectionViewCell {
    
    var isTapped: Bool = true
    
    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    let leftIcon = UIImageView()
    let rightIcon = UIImageView()
    let optionLabel: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.regular, size: 13)
        label.textColor = .black
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setStyle()
    }
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

extension MainOptionCell {
    private func setStyle() {
        contentView.makeCornerRound(radius: 15)
        contentView.makeBorder(width: 1, color: .gray_4!)
        contentView.backgroundColor = .gray_2
    }
    
    private func setLayout() {
        contentView.addSubview(hStackView)
        hStackView.addArrangedSubviews(leftIcon, optionLabel, rightIcon)
        
        hStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
        }
        
        [leftIcon, rightIcon].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(16)
            }
        }
    }
    
    func updateUI(_ item: OptionItem) {
        if !isTapped {
            var updatedItem: OptionItem
            switch item.option {
            case "초기화":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: UIImage.refresh_white, rightIcon: item.rightIcon)
            case "쿠폰":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: UIImage.icon_coupon_white, rightIcon: item.rightIcon)
            case "1인분":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: UIImage.one_serving_white, rightIcon: item.rightIcon)
            case "배민비":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: item.leftIcon, rightIcon: UIImage.arrow_down_white)
            case "별점":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: UIImage.star_white, rightIcon: UIImage.arrow_down_white)
            case "최소주문":
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: item.leftIcon, rightIcon: UIImage.arrow_down_white)
            default:
                updatedItem = OptionItem(option: item.option, status: item.status, leftIcon: UIImage.filter_white, rightIcon: item.rightIcon)
            }
            bind(updatedItem)
        } else { bind(item) }
        
    }

    func bind(_ item: OptionItem) {
       
            if item.leftIcon == nil {
                hStackView.removeArrangedSubview(leftIcon)
                leftIcon.removeFromSuperview()
            } else if item.rightIcon == nil {
                hStackView.removeArrangedSubview(rightIcon)
                rightIcon.removeFromSuperview()
            }
            
            rightIcon.image = item.rightIcon
            leftIcon.image = item.leftIcon
            optionLabel.text = item.option
            
            optionLabel.textColor = isTapped ? .black : .white
            contentView.backgroundColor = isTapped ? .gray_2 : .black
 
    }
}
