//
//  FoodService.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

import Alamofire

enum FoodService {
    case getFoodDetail(id: Int)
}

extension FoodService: BaseTargetType {

    var method: Alamofire.HTTPMethod {
        switch self {
        case .getFoodDetail:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getFoodDetail(let id):
            return "/\(id)"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .getFoodDetail(let id ):
                return .query(id)
        }
    }
}
