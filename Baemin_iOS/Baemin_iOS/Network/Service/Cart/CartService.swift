//
//  CartService.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/26.
////
//import Foundation
//
//import Alamofire
//
//final class CartNetworkManager {
//    static let shared = CartNetworkManager()
//
//    private init() {}
//
//    func fetchCartList(completion: @escaping (NetworkResult<Any>) -> Void) {
//        let url = "http://18.235.5.238:8080" + "/cart"
//        let header: HTTPHeaders = ["Content-Type": "application/json"]
//        let dataRequest = AF.request(url, method: .get, headers: header)
//
//        dataRequest.responseData { response in
//            switch response.result {
//            case .success:
//                guard let statusCode = response.response?.statusCode else { return }
//                guard let data = response.value else { return }
//
//                let networkResult = self.judgeStatus(by: statusCode, data)
//
//                completion(networkResult)
//            default:
//                completion(.networkFail)
//            }
//        }
//    }
//
//    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
//        print(statusCode)
//        switch statusCode {
//        case 200: return isValidData(data: data)
//        case 500: return .serverErr
//        default: return .networkFail
//        }
//    }
//
//    private func isValidData(data: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//
//        guard let decodedData = try? decoder.decode(CartListModel.self, from: data) else {
//            return .pathErr}
//
//        return .success(decodedData as Any)
//    }
//}
import Foundation

import Alamofire

enum CartService {
    case getCart(id: Int)
}

extension CartService: BaseTargetType {

    var method: Alamofire.HTTPMethod {
        switch self {
        case .getCart:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getCart(let id):
            return "cart/\(id)"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .getCart(let id ):
                return .query(id)
        }
    }
}

