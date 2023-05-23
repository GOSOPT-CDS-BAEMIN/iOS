//
//  BaseResponse.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
}
