//
//  CartAPI.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

import Alamofire

class CartAPI: BaseAPI {
    static let shared = CartAPI()
    
    private override init() {}
}

extension CartAPI {
    
    public func getCart(id: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(CartService.getCart(id: id)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CartResponseDTO.self,
                                completion: completion)
        }
    }
}
