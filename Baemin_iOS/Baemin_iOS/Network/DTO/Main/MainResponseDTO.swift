//
//  MainResponseDTO.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import Foundation

// MARK: - MainResponseDTO
struct MainResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [MainData]
}

// MARK: - Datum
struct MainData: Codable {
    let storeID, storeTypeID: Int
    let storeType, storeName, deliveryTime, description: String
    let minOrderPrice, deliveryFee: Int
    let rate: Double
    let firstImageURL, secondImageURL, thirdImageURL: String
    let new, couponExist: Bool

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeTypeID = "storeTypeId"
        case storeType, storeName, deliveryTime, description, minOrderPrice, deliveryFee, rate
        case firstImageURL = "firstImageUrl"
        case secondImageURL = "secondImageUrl"
        case thirdImageURL = "thirdImageUrl"
        case new, couponExist
    }
}
