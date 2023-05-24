//
//  PickUpView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/21.
//

import UIKit
import SnapKit

class PickUpView: UIView {
    
    private let emptyView: UIImageView = {
        let empty = UIImageView()
        empty.image = UIImage.empty_1.resized(toWidth: UIScreen.main.bounds.width)
        empty.sizeToFit()
        empty.contentMode = .scaleAspectFill
        return empty
    }()
    
    private func setLayOut() {
        backgroundColor = .clear
        addSubview(emptyView)
        
        emptyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // 0. init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
