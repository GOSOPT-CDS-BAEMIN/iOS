//
//  ButtonStackView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

import SnapKit

class ButtonStackView: UIStackView {
    
    // MARK: - UI Components
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
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
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
     init(leftIcon: UIImage, rightIcon: UIImage) {
        super.init(frame: .zero)
        setStyle(leftIcon: leftIcon, rightIcon: rightIcon)
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension ButtonStackView {
    private func setStyle(leftIcon: UIImage,rightIcon: UIImage) {
        leftButton.setImage(leftIcon, for: .normal)
        rightButton.setImage(rightIcon, for: .normal)
    }
    private func setLayout() {
        addArrangedSubviews(leftButton, rightButton)
        
        leftButton.snp.makeConstraints {
            $0.size.equalTo(17)
        }
        rightButton.snp.makeConstraints {
            $0.size.equalTo(17)
        }
    }
}
