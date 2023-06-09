//
//  UIView+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func makeCornerRound (radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = false
    }
    
    func makeBorder(width: CGFloat, color: UIColor ) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
