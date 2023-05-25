//
//  ButtonStackView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

import SnapKit

final class ButtonStackView: UIStackView {
    
    // MARK: - UI Components
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    var leftButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var rightButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // MARK: - initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

private extension ButtonStackView {
    
    func setLayout() {
        addArrangedSubviews(leftButton, rightButton)
        
        leftButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        rightButton.snp.makeConstraints {
            $0.size.equalTo(50)
        }
    }
}
