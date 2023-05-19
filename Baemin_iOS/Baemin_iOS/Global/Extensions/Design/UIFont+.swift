//
//  UIFont+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

extension UIFont {
    
    // MARK: - AppleSDGothicNeo Font
    
    public enum AppleSDGothicNeoType: String {
        case bold = "B00"
        case semiBold = "SB00"
        case extraBold = "EB00"
        case regular = "R00"
        case medium = "M00"
    }
    
    static func AppleSDGothicNeo(_ type: AppleSDGothicNeoType, size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo\(type.rawValue)", size: size)!
    }
}
