//
//  PickUpView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit

import SnapKit

class PickUpView: UIView {
    
    // MARK: - UI Components

    private let emptyView: UIImageView = {
        let empty = UIImageView()
        empty.image = UIImage.empty_1.resized(withPercentage: 1.3)
        empty.sizeToFit()
        return empty
    }()
    
    // MARK: - initialize func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setLayOut() {
        backgroundColor = .clear
        addSubview(emptyView)
        
        emptyView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}
