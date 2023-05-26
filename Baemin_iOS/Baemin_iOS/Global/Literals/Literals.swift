//
//  Literals.swift
//  Baemin_iOS
//
//  Created by 김응관 on 2023/05/16.
//

import Foundation

import UIKit

struct I18N {
    
    /// cart
    struct Cart {
        static let totalPrice = "총 주문금액"
        static let totalPay = "결제예정금액"
        static let notice = "(주)우아한형제들은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 따라서 (주)우아한형제들은 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다."
        static let deliveryTip = "배달팁 포함"
        static let deleteMenu = "상품삭제"
        static let addMenu = "+ 메뉴 추가"
        static let order = "배달 주문하기"
    }
    
    struct StoreDetail {
        static let orderTogether = "함께주문"
        static let share = "공유"
        static let call = "전화"
        static let ownerComment = "최근사장님댓글"
        static let recentReview = "최근리뷰"
        static let delivery = "배달주문"
        static let pickUp = "포장/방문주문"
    }
    
    /// review
    struct Review {
        static let refresh = "옵션 재설정"
        static let showReview = "리뷰보기"
        static let title = "음식을 선택해주세요"
    }
    
    
    struct Main {
        static let minimum = "최소주문"
        static let delivery = "배달"
        static let packing = "포장가능"
    }
    
    struct StickyHeader {
        static let menu = "메뉴"
        static let review = "리뷰"
        static let info = "정보"
    }
}
