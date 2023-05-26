//
//  MenuInfo.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/26.
//

import UIKit

struct MenuItem {
    var name: String
    var price: String
    var img: UIImage
    var isPopular: Bool
}

extension MenuItem {
    static var items: [MenuItem] = [
        MenuItem(name: "라즈지辣子鶏", price: "18,000원", img: .dummy, isPopular: false),
        MenuItem(name: "우육도삭면牛肉刀削面", price: "9,000원", img: .dummy, isPopular: false),
        MenuItem(name: "유린기油淋鷄", price: "18,000원", img: .dummy, isPopular: false),
        MenuItem(name: "짬뽕도삭면海鲜面刀削面", price: "9,000원", img: .dummy, isPopular: false),
        MenuItem(name: "풍미가지风味茄子", price: "9,000원", img: .dummy, isPopular: false)
    ]
}
