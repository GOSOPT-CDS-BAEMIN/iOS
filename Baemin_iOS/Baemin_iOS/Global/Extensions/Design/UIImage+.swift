//
//  Images+.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/18.
//

import UIKit

extension UIImage {
    
    /// Icon
    
    static let arrow_back = UIImage(named: "arrow_back")!
    static let arrow_down = UIImage(named: "arrow_down")!
    static let arrow_down_white = UIImage(named: "arrow_down_white")!
    static let arrow_up_down = UIImage(named: "arrow-up-down")!
    static let bold_arrow_down = UIImage(named: "bold_arrow_down")!
    static let bold_x = UIImage(named: "bold_x")!
    static let cart = UIImage(named: "cart")!
    static let delivery = UIImage(named: "delivery")!
    static let download = UIImage(named: "download")!
    static let filter = UIImage(named: "filter")!
    static let filter_white = UIImage(named: "filter_white")!
    static let home = UIImage(named: "home")!
    static let minus = UIImage(named: "minus")!
    static let one_serving = UIImage(named: "one_serving")!
    static let one_serving_white = UIImage(named: "one_serving_white")!
    static let person_add = UIImage(named: "person_add")!
    static let people = UIImage(named: "people")!
    static let pick_up = UIImage(named: "pick_up")!
    static let plus = UIImage(named: "plus")!
    static let popular = UIImage(named: "popular")!
    static let rate_star = UIImage(named: "rate_star")!
    static let refresh = UIImage(named: "refresh")!
    static let refresh_white = UIImage(named: "refresh_white")!
    static let review_filter = UIImage(named: "review_filter")!
    
    static let share = UIImage(named: "sharing")!
    static let speaker = UIImage(named: "speaker")!
    static let star = UIImage(named: "star")!
    static let star_white = UIImage(named: "star_white")!
    static let trashbin = UIImage(named: "trashbin")!
    static let x = UIImage(named: "x")!
    static let yellow_star = UIImage(named: "yellow_star")!
    static let full_star = UIImage(named: "full_star")!
    static let five_star = UIImage(named: "five_star")!
    static let like_heart = UIImage(named: "like_heart")!
    
    static let icon_coupon = UIImage(named: "icon_coupon")!
    static let icon_coupon_white = UIImage(named: "icon_coupon_white")!

    /// Button
    
    static let add_more = UIImage(named: "add_more")!
    static let box_goto_add = UIImage(named: "box_goto_add")!
    static let checked = UIImage(named: "checked")!
    static let circle_empty = UIImage(named: "circle_empty")!
    static let goto_add = UIImage(named: "goto_add")!
    static let get_coupon = UIImage(named: "get_coupon")!
    static let instant_coupon = UIImage(named: "instant_coupon")!
    static let radio_default = UIImage(named: "radio_default")!
    static let radio_selected = UIImage(named: "radio_selected")!
    static let radio_delivery = UIImage(named: "radio-delivery")!
    static let radio_pickup = UIImage(named: "radio-pickup")!
    static let madein = UIImage(named: "madein")!
    
    /// Option
    
    static let clean_review = UIImage(named: "clean_review")!
    static let coupon = UIImage(named: "coupon")!
    static let delivery_man = UIImage(named: "delivery_man")!
    static let recommend = UIImage(named: "recommend")!
    static let vertical_bar = UIImage(named: "vertical_bar")!
    static let review_bar = UIImage(named: "review_bar")!
    static let famous = UIImage(named: "famous")!
    
    /// Tag
    
    static let coupon_tag = UIImage(named: "coupon_tag")!
    static let new = UIImage(named: "new")!
    static let signiture = UIImage(named: "signiture")!
    static let detail = UIImage(named: "detail")!
    
    /// TabBar
    
    static let empty_heart = UIImage(named: "empty_heart")!
    static let order_list = UIImage(named: "order_list")!
    static let search = UIImage(named: "search")!
    static let smile = UIImage(named: "smile")!
    
    /// Skeleton
    
    static let empty_1 = UIImage(named: "empty_1")!
    static let empty_2 = UIImage(named: "empty_2")!
    static let empty_3 = UIImage(named: "empty_3")!
    
    // dummy test image
    static let dummy = UIImage(named: "dummy")!
    
    /// 이미지 사이즈 조정 함수 (feat. 지희 꿀코드)

    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
