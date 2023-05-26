//
//  MainService.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//
//
//import Foundation
//
//import Alamofire
//
//enum MainService {
//    case getStore(id: Int)
//}
//
//extension MainService: BaseTargetType {
//    
//    var method: Alamofire.HTTPMethod {
//        switch self {
//        case .getStore:
//            return .get
//        }
//    }
//    
//    var path: String {
//        switch self {
//        case .getStore(let id):
//            return "store"+"/\(id)"
//        }
//    }
//    
//    var parameters: RequestParams {
//        switch self {
//        case .getStore(let id):
//                return .query(id)
//        }
//    }
//}
