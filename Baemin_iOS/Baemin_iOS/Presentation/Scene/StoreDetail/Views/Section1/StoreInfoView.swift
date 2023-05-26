//
//  StoreInfoView.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/20.
//

import UIKit

import SnapKit

class StoreInfoView: UIView {
    
    // MARK: - Property
    let storeImage = UIImageView()
    
    // MARK: - init func
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureContents() {
        
        storeImage.contentMode = .scaleAspectFit
        storeImage.sizeToFit()
        storeImage.image = .dummy.resized(toWidth: UIScreen.main.bounds.width+5)
        storeImage.insetsLayoutMarginsFromSafeArea = false
        
        addSubview(storeImage)
        
        storeImage.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(-30)
        }
    }
}
