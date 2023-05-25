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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 인덱스 변경시
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            menuView.view.isHidden = false
            infoView.view.isHidden = true
            commentView.view.isHidden = true
        case 1:
            menuView.view.isHidden = true
            infoView.view.isHidden = false
            commentView.view.isHidden = true
        case 2:
            menuView.view.isHidden = true
            infoView.view.isHidden = true
            commentView.view.isHidden = false
        }
    }

    //menuView.view, infoView.view, commentView.view

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}
