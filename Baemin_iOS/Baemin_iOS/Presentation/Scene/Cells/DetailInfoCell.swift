//
//  DetailInfoCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class DetailInfoCell: UITableViewCell {
    
    // 세그먼트 탭마다 나타날 VC
    private let menuView = MenuVC()
    private let infoView = InfoVC()
    private let commentView = ReviewVC()
    
    // init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayOut()
        setStyle()
        setNotificationCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        contentView.backgroundColor = .white
    }
    
    func setLayOut() {
        
        contentView.addSubviews(menuView.view, infoView.view, commentView.view)
        
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
        print(tmp)

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
