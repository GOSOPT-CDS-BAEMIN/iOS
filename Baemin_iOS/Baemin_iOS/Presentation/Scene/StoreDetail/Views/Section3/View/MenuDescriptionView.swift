//
//  MenuDescriptionView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuDescriptionView: UIView {
    
    // MARK: - UI Components

    private let madinBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.madein.resized(toWidth: 65), for: .normal)
        btn.sizeToFit()
        btn.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let article: UILabel = {
        let label = UILabel()
        label.text = I18N.MenuView.introuduce
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.sizeToFit()
        return label
    }()
    
    // MARK: - initialize func
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setStyle() {
        backgroundColor = .clear
    }
    
    func setLayOut() {
        addSubviews(madinBtn, article)
        
        madinBtn.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        article.snp.makeConstraints {
            $0.top.equalTo(madinBtn.snp.bottom)
            $0.leading.equalTo(madinBtn)
            $0.bottom.equalToSuperview()
        }
    }

}
