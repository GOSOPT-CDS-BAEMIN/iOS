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
    var infoView = InfoVC()
    var commentView = ReviewVC()
    var renewalView = RenewalVC()
    
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

    func renewalBind(_ foodData: [Food]) {
        renewalView.descriptionView.article.text = foodData.first?.foodDescription
        renewalView.cellCount = foodData.count
        renewalView.foodList = foodData
    }
    
    func setStyle() {
        backgroundColor = .white
    }
    
    func setLayOut() {
        
        contentView.addSubviews(infoView.view, commentView.view, renewalView.view)
    
        renewalView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        infoView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        commentView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        renewalView.view.isHidden = false
        infoView.view.isHidden = true
        commentView.view.isHidden = true
    }
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("categoryIndex"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        let tmp = notification.object as! Int

        if tmp == 0 {
            renewalView.view.isHidden = false
            infoView.view.isHidden = true
            commentView.view.isHidden = true
        } else if tmp == 1 {
            renewalView.view.isHidden = true
            infoView.view.isHidden = false
            commentView.view.isHidden = true
        } else {
            renewalView.view.isHidden = true
            infoView.view.isHidden = true
            commentView.view.isHidden = false
        }
    }
    
}
