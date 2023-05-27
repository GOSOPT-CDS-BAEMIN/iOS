//
//  MenuDetailService.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/27.
//
//
import Foundation

import Alamofire

enum MenuDetailService {
    case getMenuDetail(id: Int)
    case putMenuDetail(MenuDetailRequest)
}

extension MenuDetailService: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getMenuDetail:
            return .get
        case .putMenuDetail:
            return .put
        }
    }
    
    var path: String {
        switch self {
        case .getMenuDetail(let id):
            return "food/\(id)"
        case .putMenuDetail:
            return "cart"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getMenuDetail:
            return .none
        case .putMenuDetail(let request):
            return .body(request)
        }
    }
}

struct MenuDetailRequest: Codable {
    let clientId: Int
    let foodIds: [Int]?
    var foodCounts: [Int]?
}
