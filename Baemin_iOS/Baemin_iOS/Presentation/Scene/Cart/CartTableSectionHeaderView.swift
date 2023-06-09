//
//  CartTableSectionHeaderView.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/22.
//

import UIKit

import SnapKit

class CartTableSectionHeaderView: UIView {

    // MARK: - UI Properties

    var headerClosure: ((_ result: Bool) -> Void)?
    weak var delegate: TableSectionHeaderDelegate?
    var section: Int = 0

    lazy var storeCheckButton: UIButton = {
        let button = UIButton()
        button.setImage(.circle_empty, for: .normal)
        button.setImage(.checked, for: .selected)
        button.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        return button
    }()

    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .AppleSDGothicNeo(.bold, size: 16)
        return label
    }()

    lazy var storeDeleteButton: UIButton = {
        let button = UIButton()
        button.setImage(.x, for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 8)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CartTableSectionHeaderView {

    func dataBind(item: FoodsList) {
        storeNameLabel.text = item.storeName
        }

    private func setLayout() {
        self.addSubviews(storeCheckButton, storeNameLabel, storeDeleteButton)
        self.backgroundColor = .white

        storeCheckButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        storeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(storeCheckButton.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        storeDeleteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
    }
    
    @objc
    private func headerButtonTapped(_ sender: UIButton) {
        let selected = !sender.isSelected
        sender.isSelected = selected
        delegate?.didSelectHeaderButton(section: section, selected: selected)
    }
    
    @objc
    private func deleteButtonTapped(_ sender: UIButton) {
        let selected = !sender.isSelected
        sender.isSelected = selected
        delegate?.passSelectedSection(section: section)
    }
}

protocol TableSectionHeaderDelegate: AnyObject {
    func didSelectHeaderButton(section: Int, selected: Bool)
    func passSelectedSection(section: Int)
}
