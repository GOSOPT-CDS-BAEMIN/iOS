//
//  DetailInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class DetailInfoCell: UITableViewCell {
    
    // MARK: - Properties
    var menuView = MenuVC()
    var infoView = InfoVC()
    var commentView = ReviewVC()
    
    // MARK: - init func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayOut()
        setStyle()
        setNotificationCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func bind(_ foodData: [Food]) {
        
        foodData.forEach {
            menuView.firstView.menuName.text = $0.foodName
            menuView.firstView.foodImg.getImageFromURL($0.foodImageURL)
            menuView.firstView.price.text = "\($0.price)원"
            menuView.descriptionView.article.text = $0.foodDescription
        }
    }
    
    func setStyle() {
        backgroundColor = .white
    }
    
    func setLayOut() {
        
        addSubviews(menuView.view, infoView.view, commentView.view)
        
        menuView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        infoView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        commentView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        menuView.view.isHidden = false
        infoView.view.isHidden = true
        commentView.view.isHidden = true
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("categoryIndex"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int

        if tmp == 0 {
            menuView.view.isHidden = false
            infoView.view.isHidden = true
            commentView.view.isHidden = true
        } else if tmp == 1 {
            menuView.view.isHidden = true
            infoView.view.isHidden = false
            commentView.view.isHidden = true
        } else {
            menuView.view.isHidden = true
            infoView.view.isHidden = true
            commentView.view.isHidden = false
        }
    }

}
