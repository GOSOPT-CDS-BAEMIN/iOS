//
//  MenuInfoReviewCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/25.
//

import UIKit

import SnapKit

class MenuInfoReviewCell: UITableViewCell {
    
    let stickyHeaderView = stickyHeaderView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayOut()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        contentView.backgroundColor = .white
    }
}
