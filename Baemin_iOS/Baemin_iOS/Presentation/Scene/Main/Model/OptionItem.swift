//
//  OptionItem.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import UIKit

enum Status {
    case on, off
}

enum Option {
    case INITIAL, COUPON, ONE, DELIVERY, RATE, MINIMUM, OTHER
    
    var title: String {
        switch self {
        case .INITIAL:
            return "초기화"
        case .COUPON:
            return "쿠폰"
        case .ONE:
            return "1인분"
        case .DELIVERY:
            return "배달비"
        case .RATE:
            return "별점"
        case .MINIMUM:
            return "최소주문"
        case .OTHER:
            return "기타"
        }
    }
}

struct OptionItem {
    var option: Option
    var status: Status
    var leftIcon: UIImage?
    var rightIcon: UIImage?
    
    static var item: [OptionItem] = [OptionItem(option: .INITIAL, status: .off, leftIcon: UIImage.refresh),
                                     OptionItem(option: .COUPON, status: .off, leftIcon: UIImage.icon_coupon),
                                     OptionItem(option: .ONE, status: .off, leftIcon: UIImage.one_serving),
                                     OptionItem(option: .DELIVERY, status: .off, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: .RATE, status: .off, leftIcon: UIImage.star, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: .MINIMUM, status: .off, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: .OTHER, status: .off, leftIcon: UIImage.filter)
        ]

    public func isSelected() -> Self {
        switch self.status {
        case .off:
            switch self.option {
            case .INITIAL:
                return OptionItem(option: option, status: status, leftIcon: .refresh, rightIcon: UIImage(named: ""))
            case .COUPON:
                return OptionItem(option: option, status: status, leftIcon: .icon_coupon, rightIcon: UIImage(named: ""))
            case .ONE:
                return OptionItem(option: option, status: status, leftIcon: .one_serving, rightIcon: UIImage(named: ""))
            case .DELIVERY:
                return OptionItem(option: option, status: status, leftIcon: nil, rightIcon: .arrow_down)
            case .RATE:
                return OptionItem(option: option, status: status, leftIcon: .star, rightIcon: .arrow_down)
            case .MINIMUM:
                return OptionItem(option: option, status: status, leftIcon: nil, rightIcon: .arrow_down)
            case .OTHER:
                return OptionItem(option: option, status: status, leftIcon: .filter, rightIcon: nil)
            }
            
        case .on:
            switch self.option {
            case .INITIAL:
                return OptionItem(option: option, status: status, leftIcon: .refresh_white, rightIcon: nil)
            case .COUPON:
                return OptionItem(option: option, status: status, leftIcon: .icon_coupon_white, rightIcon: nil)
            case .ONE:
                return OptionItem(option: option, status: status, leftIcon: .one_serving_white, rightIcon: nil)
            case .DELIVERY:
                return OptionItem(option: option, status: status, leftIcon: nil, rightIcon: .arrow_down_white)
            case .RATE:
                return OptionItem(option: option, status: status, leftIcon: .star_white, rightIcon: nil)
            case .MINIMUM:
                return OptionItem(option: option, status: status, leftIcon: nil, rightIcon: .arrow_down_white)
            case .OTHER:
                return OptionItem(option: option, status: status, leftIcon: .filter_white, rightIcon: nil)
            }
        }
    }
}
