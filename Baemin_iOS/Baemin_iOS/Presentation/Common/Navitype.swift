//
//  Navitype.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/20.
//

import UIKit

enum NaviType {
    case main, cart, menu
    
    var rightIcon: UIImage {
        switch self {
        case .main, .menu: return UIImage.cart!
        case .cart: return UIImage.people!
        }
    }
    var title: String {
        switch self {
        case .cart: return "장바구니"
        case .main, .menu: reutrn ""
        }
    }
}
