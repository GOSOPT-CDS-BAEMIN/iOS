//
//  CartService.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/26.
import Foundation

import Alamofire

enum CartService {
    case getCart(id: Int)
    case deleteCart(id: Int)
}

extension CartService: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getCart:
            return .get
        case .deleteCart:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .getCart(let id):
            return "cart/\(id)"
        case .deleteCart(let id): // NOT RIGHT
            return "cart\(id)"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getCart(let id ):
            return .query(id)
        case .deleteCart(let id):  // NOT RIGHT
            return .query(id)
        }
    }
}
