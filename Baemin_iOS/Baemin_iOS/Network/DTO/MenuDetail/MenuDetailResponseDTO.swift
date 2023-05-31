//
//  MenuDetailResponseDTO.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/27.
//

import Foundation

// MARK: - MenuDetailResponseDTO

struct MenuDetailResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: MenuDetail
}

// MARK: - MenuDetail

struct MenuDetail: Codable {
    let foodID: Int
    let foodName: String
    let price: Int
    let foodDescription: String
    let foodImageURL: String
    let best: Bool

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case foodName, price, foodDescription
        case foodImageURL = "foodImageUrl"
        case best
    }
}
