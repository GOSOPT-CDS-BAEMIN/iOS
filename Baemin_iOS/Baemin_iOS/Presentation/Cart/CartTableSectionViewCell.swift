//
//  CartTableViewCell.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/20.
//

import UIKit

import SnapKit

class CartTableSectionViewCell: UITableViewCell {
    
    // MARK: - UI Properties

    static let idf = NSObject.identifier
    
    var countClosure: ((_ result:Bool)->Void)?
    
    // 메뉴 Stackview 구성
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private let menuImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = .dummy
        imageview.makeCornerRound(radius: 8)
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        // label.text = "test 메뉴이름"
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()
    
    private let menuPriceLabel: UILabel = {
        let label = UILabel()
        // label.text = "test 메뉴가격"
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        return label
    }()
        
     lazy var menuCheckButton: UIButton = {
        let button = UIButton()
        button.setImage(.circle_empty, for: .normal)
        button.setImage(.checked, for: .selected)
        button.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
        return button
    }()
    
    private let menuCountView = MenuCountView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
}

// MARK: - Methods

extension CartTableSectionViewCell {
    
    func dataBind(item: FoodsList, index: Int) {
        menuNameLabel.text = item.storeName
        menuPriceLabel.text = "\(item.foods[index].price)원"
        menuCountView.numberLabel.text = "\(item.foods[index].foodCount)"
        }

    func setStyle() {
        self.backgroundColor = .white
    }
    
    func setLayout() {
        contentView.addSubview(menuStackView)
        menuStackView.addSubviews(menuCheckButton, menuImageView, menuNameLabel, menuPriceLabel, menuCountView)
        
        menuStackView.snp.makeConstraints {
            $0.width.equalTo(351)
            $0.height.equalTo(156)
        }
        menuCheckButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(14)
            $0.width.height.equalTo(24)
        }
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(menuCheckButton.snp.trailing).offset(12)
            $0.width.height.equalTo(68)
        }
        menuNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(14)
        }
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(14)
        }
        menuCountView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(95)
            $0.height.equalTo(32)
        }
    }
    
    @objc
    func changeButton() {
        self.countClosure?(true)
    }
}
