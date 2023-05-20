//
//  CustomNavigaionView.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

import SnapKit

class CustomNavigaionView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private lazy var backButton: UIButton = {
      let button = UIButton()
        button.setImage(.arrow_back, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
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

extension CustomNavigaionView {
    
    private func setStyle() {
        
    }
    private func setLayout() {
        addSubview(backButton)
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.size.equalTo(24)
        }
        
    }
}
