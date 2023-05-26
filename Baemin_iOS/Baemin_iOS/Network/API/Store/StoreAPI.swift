//
//  StoreAPI.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

import Alamofire

class StoreAPI: BaseAPI {
    static let shared = MainAPI()
    
    private(set) var getMainStoreData: StoreResponseDTO?
    private override init() {}
}

extension StoreAPI {
    public func getStoreInfo(request: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
           AFManager.request(StoreService.getStore(id: request)).responseData { response in
               print("✅: \(response)")
               self.disposeNetwork(response,
                                   dataModel: StoreResponseDTO.self,
                                   completion: completion)
           }
       }
}
