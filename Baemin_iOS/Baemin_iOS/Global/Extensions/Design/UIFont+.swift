//
//  UIFont+.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/19.
//

import UIKit

extension UIFont {
    
    // MARK: - Pretendard Font
    
    public enum PretendardType: String {
        case bold = "B"
        case semiBold = "SB"
        case extraBold = "EB"
        case regular = "R"
        case medium = "M"
    }
    
    static func Pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo\(type.rawValue)", size: size)!
    }
}
