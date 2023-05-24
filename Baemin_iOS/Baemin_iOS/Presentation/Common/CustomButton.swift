//
//  CustomButton.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import UIKit

import SnapKit

class CustomButton: UIView {
    
    // MARK: - UI Components
    
    lazy var reviewButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .AppleSDGothicNeo(.bold, size: 18)
        button.setTitle("리뷰보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray_4
        
        return button
    }()
    
    lazy var resetting: UIButton = {
        let button = UIButton(configuration: .plain())
        button.configuration?.baseForegroundColor = .black
        button.configuration?.image = .refresh
        let attributedTitle = NSAttributedString(string: "옵션 재설정",
                                                 attributes: [.font: UIFont.AppleSDGothicNeo(.regular, size: 12)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    // MARK: - initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CustomButton {
    func updateUI(isTapped: Bool) {
        reviewButton.backgroundColor = isTapped ? .primary_2 : .gray_4
    }
    
    private func setLayout() {
        addSubviews(resetting, reviewButton)
        
        resetting.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 16))
        }
        
        reviewButton.snp.makeConstraints {
            $0.directionalVerticalEdges.trailing.equalToSuperview()
            $0.width.equalTo(220)
        }
    }
}
