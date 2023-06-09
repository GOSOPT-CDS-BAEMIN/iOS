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
    var storeImage = UIImageView()
    
    private lazy var emptyImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.empty_2.resized(toWidth: UIScreen.main.bounds.width)
        img.sizeToFit()
        return img
    }()
    
    // MARK: - init func
    
    init(frame: CGRect, imgURL: String) {
        super.init(frame: frame)
        bind(imgURL)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func bind(_ url: String) {
        if url == "" {
            storeImage = emptyImage
        } else {
            storeImage.getImageFromURL(url)
        }
    }
    
    func configureContents() {
        
        storeImage.contentMode = .scaleAspectFill
        storeImage.sizeToFit()
        
        addSubview(storeImage)
        
        storeImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
