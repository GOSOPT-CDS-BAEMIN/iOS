//
//  FoodAPI.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

import Alamofire

class FoodAPI: BaseAPI {
    static let shared = MainAPI()
    
    private override init() {}
}

extension FoodAPI {
    
    public func getFoodDetail(id: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(MainService.getStore(id: id)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: FoodResponseDTO.self,
                                completion: completion)
        }
    }
