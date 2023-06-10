//
//  MenuDescriptionView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuDescriptionView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    var indexClosure: ((_ index: CGFloat) -> Void)?

    private let madinBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.madein.resized(toWidth: 65), for: .normal)
        btn.sizeToFit()
        btn.contentMode = .scaleAspectFill
        return btn
    }()
    
    var article: UILabel = {
        let label = UILabel()
        label.text = I18N.MenuView.introuduce
        label.font = .AppleSDGothicNeo(.regular, size: 16)
        label.sizeToFit()
        return label
    }()
    
    private let famous: UIImageView = {
        let view = UIImageView()
        view.image = .famous
        view.sizeToFit()
        return view
    }()
    
    // MARK: - initialize func
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setStyle() {
        contentView.backgroundColor = .clear
        self.indexClosure?(contentView.bounds.height)
    }
    
    func setLayOut() {
        contentView.addSubviews(madinBtn, article, famous)
        
        madinBtn.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        article.snp.makeConstraints {
            $0.top.equalTo(madinBtn.snp.bottom)
            $0.leading.equalTo(madinBtn)
        }
        
        famous.snp.makeConstraints {
            $0.top.equalTo(article.snp.bottom).offset(72)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
