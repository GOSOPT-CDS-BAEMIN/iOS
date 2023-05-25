//
//  MenuDescriptionCellTableViewCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

import SnapKit

class MenuDescriptionCell: UITableViewCell {
    
    let descriptionView = MenuDescriptionView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayOut()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        contentView.backgroundColor = .clear
    }
    
    func setLayOut() {
        contentView.addSubview(descriptionView)
        
        descriptionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(21)
            $0.bottom.equalToSuperview()
        }
    }

}
