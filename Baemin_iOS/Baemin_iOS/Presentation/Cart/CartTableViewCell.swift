//
//  CartTableViewCell.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/20.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let idf = NSObject.identifier
    
    private let storeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    var menuImageView: UIImageView = {
        let imageview = UIImageView()
        return imageview
    }()
    
    var menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "test 메뉴이름"
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()
    
    var menuPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "test 메뉴가격"
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        return label
    }()
    
    var menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .AppleSDGothicNeo(.medium, size: 14)
        return label
    }()
    
    let menuCheckButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

}
