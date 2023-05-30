//
//  Navitype.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/20.
//

import UIKit

enum NaviType {
    case main(SubMainItem)
    case cart(SubCartItem)
    case menu(SubMenuItem)
    case store(SubStoreItem)
    
    var title: String {
        switch self {
        case .cart: return "장바구니"
        case .main, .menu, .store: return ""
        }
    }
}

enum SubMainItem {
    case leftButton, rightButton
    
    var leftIcon: UIImage {
        switch self {
        case .leftButton: return UIImage.arrow_back
        case .rightButton: return UIImage.home
        }
    }
    
    var rightIcon: UIImage {
        switch self {
        case .leftButton: return UIImage.delivery
        case .rightButton: return UIImage.cart
        }
    }
}

enum SubStoreItem {
    
    case leftButton, rightButton
    
    var leftIcon: UIImage {
        switch self {
        case .leftButton: return UIImage.arrow_back
        case .rightButton: return UIImage.home
        }
    }
    
    var rightIcon: UIImage? {
        switch self {
        case .rightButton: return UIImage.cart
        case .leftButton: return nil
        }
    }
}

enum SubCartItem {
    
    case leftButton, rightButton
    
    var leftIcon: UIImage {
        switch self {
        case .leftButton: return UIImage.arrow_back
        case .rightButton: return UIImage.home
        }
    }
    
    var rightIcon: UIImage? {
        switch self {
        case .rightButton: return UIImage.people
        case .leftButton: return UIImage.cart
        }
    }
}

enum SubMenuItem {
    
    case leftButton, rightButton
    
    var leftIcon: UIImage {
        switch self {
        case .leftButton: return UIImage.arrow_back
        case .rightButton: return UIImage.home
        }
    }
    
    var rightIcon: UIImage? {
        switch self {
        case .rightButton: return UIImage.cart
        case .leftButton: return nil
        }
    }
}
