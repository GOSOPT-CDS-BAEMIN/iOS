//
//  RenewalTableViewCell.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/06/07.
//

import UIKit

import SnapKit

class RenewalTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var indexClosure: ((_ index: Int) -> Void)?
    
    var index: Int = 0
    
    var firstView = MenuBaseView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    func bind(_ foodData: Food) {
        
        firstView.menuName.text = foodData.foodName
        firstView.foodImg.getImageFromURL(foodData.foodImageURL)
        firstView.price.text = "\(foodData.price)원"
    }
    
    func setStyle() {
        backgroundColor = .white
    }
    
    func setLayOut() {
        contentView.addSubview(firstView)
        
        firstView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
