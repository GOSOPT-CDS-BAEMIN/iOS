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

struct OptionItem {
    var option: String
    var status: Status
    var leftIcon: UIImage?
    var rightIcon: UIImage?
}
extension OptionItem {
    static var item: [OptionItem] = [OptionItem(option: "초기화", status: .on, leftIcon: UIImage.refresh),
                                     OptionItem(option: "쿠폰", status: .on, leftIcon: UIImage.icon_coupon),
                                     OptionItem(option: "1인분", status: .on, leftIcon: UIImage.one_serving),
                                     OptionItem(option: "배민비", status: .on, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: "별점", status: .on, leftIcon: UIImage.star, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: "최소주문", status: .on, rightIcon: UIImage.arrow_down),
                                     OptionItem(option: "기타", status: .on, leftIcon: UIImage.filter)
    ]
}
