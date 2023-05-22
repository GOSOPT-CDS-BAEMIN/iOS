//
//  CartTableViewCell.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/20.
//

import UIKit

class CartTableSectionViewCell: UITableViewCell {
    
    static let idf = NSObject.identifier
    
    // 메뉴 Stackview 구성
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .white
        return stackView
    }()
    
    var menuImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = .dummy
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
        
    let menuCheckButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // 메뉴 StackView - 메뉴 수량 버튼
    
    let menuCountView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .AppleSDGothicNeo(.medium, size: 14)
        return label
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
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
}

private extension CartTableSectionViewCell {
    func setStyle() {
        self.backgroundColor = .white
        
    }
    func setLayout() {
        contentView.addSubview(menuStackView)
        
    }
    /*
    func changeButton() {
        if (menuCountLabel.text == "1") {
            minusButton.backgroundImage(for: .normal) = UIImage(systemName: "heart")
        }
        else {
            minusButton.backgroundImage(for: .normal) = UIImage(systemName: "star")
        }
    }
     */
}
