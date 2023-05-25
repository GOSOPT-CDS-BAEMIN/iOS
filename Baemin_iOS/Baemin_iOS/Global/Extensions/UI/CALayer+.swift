//
//  CALayer+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor? = .black,
        alpha: Float = 1,
        x: CGFloat = 2,
        y: CGFloat = 4,
        blur: CGFloat = 6
    ) {
        shadowColor = color?.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}
