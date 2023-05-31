//
//  BaseTargetType.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

import Alamofire

protocol BaseTargetType: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}

extension BaseTargetType {

    var baseURL: String {
        return Config.baseURL // --- 🍔
    }
    
    // URLRequestConvertible 구현
    func asURLRequest() throws -> URLRequest {
                // --- 🍗
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
                // --- 🍕
        urlRequest.setValue(APIConstants.applicationJSON, forHTTPHeaderField: APIConstants.contentType)

                // --- 🍪
        switch parameters {
        case .query(let request):
            let params = request?.toDictionary() ?? [:]
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .body(let request):
            let params = request?.toDictionary() ?? [:]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        case .both(let query, let body):
            let params = query?.toDictionary() ?? [:]
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
            let body = body?.toDictionary() ?? [:]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        case .none:
            break
        }
        return urlRequest
    }
}
enum RequestParams {
    case both(_ parameter1: Encodable?, _ parameter2: Encodable? )
    case query(_ parameter: Encodable?)
    case body(_ parameter: Encodable?)
    case none
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else { return [:] }
        return dictionaryData
    }
}
