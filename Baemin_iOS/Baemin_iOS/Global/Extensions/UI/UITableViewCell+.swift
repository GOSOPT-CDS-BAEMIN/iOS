//
//  UITableViewCell+.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/24.
//

import UIKit

extension UITableViewCell {
    
    func addSubviewsInContentView(_ views: UIView...) {
        views.forEach { contentView.addSubview($0)}
    }
}
