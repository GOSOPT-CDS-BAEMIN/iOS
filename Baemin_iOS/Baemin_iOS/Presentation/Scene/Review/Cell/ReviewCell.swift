//
//  ReviewCell.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class ReviewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var isTapped: Bool = false {
        didSet {
            updateUI(isTapped: isTapped)
        }
    }
    
    // MARK: - UI Components
    
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 7
        return stack
    }()
    
    private let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = .circle_empty
        return iconImage
    }()
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.font = .AppleSDGothicNeo(.medium, size: 16)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initialization
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateUI(isTapped: false)
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

extension ReviewCell {
    
    private func setStyle() {
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubviews(iconImage, menuLabel)
        
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        iconImage.snp.makeConstraints {
            $0.size.equalTo(22)
        }
    }
    
    private func updateUI(isTapped: Bool) {
        iconImage.image = isTapped ? .checked : .circle_empty
    }
    
    func bind(item: Food ) {
        menuLabel.text = item.foodName
        print("✅\(menuLabel.text)")

    }
}

// dummy 값 API 연결 후 삭제하겠습니다
struct Item {
    var menu: String
    
    static func dummy() -> [Item] {
        let items: [Item] = [Item(menu: "육회비빔밥"),
                             Item(menu: "육회비빔밥"),
                             Item(menu: "육회비빔밥")
        ]
        return items
    }
}
