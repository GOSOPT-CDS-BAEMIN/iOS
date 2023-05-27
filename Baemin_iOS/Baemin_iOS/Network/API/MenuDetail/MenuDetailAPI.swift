//
//  MenuDetailAPI.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/27.
//
//
import Foundation

import Alamofire

class MenuDetailAPI: BaseAPI {
    static let shared = MenuDetailAPI()
    
    private override init() {}
}

extension MenuDetailAPI {
    
    public func putMenuDetail(body: MenuDetailRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(MenuDetailService.putMenuDetail(body)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SimpleResponse.self,
                                completion: completion)
        }
    }
    public func getMenuDetail(id: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(MenuDetailService.getMenuDetail(id: id)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: MenuDetailResponseDTO.self,
                                completion: completion)
        }
    }
}
