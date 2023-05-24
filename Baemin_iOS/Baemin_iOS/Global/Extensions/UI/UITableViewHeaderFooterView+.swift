//
//  UITableViewHeaderFooterView+.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/25.
//

import UIKit

extension UITableViewHeaderFooterView {
    
    func addSubviewsInHeaderFooterView(_ views: UIView...) {
        views.forEach { contentView.addSubview($0)}
    }
}
