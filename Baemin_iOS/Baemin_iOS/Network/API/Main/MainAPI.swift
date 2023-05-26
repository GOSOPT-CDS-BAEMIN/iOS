//
//  MainAPI.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/26.
//

import Foundation

import Alamofire

class MainAPI: BaseAPI {
    static let shared = MainAPI()
    
    private(set) var getMainData: MainResponseDTO?
    private override init() {}
}

extension MainAPI {
    
    public func getStore(id: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(MainService.getStore(id: id)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: MainResponseDTO.self,
                                completion: completion)
        }
    }
}
