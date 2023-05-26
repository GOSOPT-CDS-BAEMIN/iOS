//
//  MainResponseDTO.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import Foundation

// MARK: - DailyMissionResponseDTO
struct DailyMissionResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let storeInfo: StoreInfo
    let foods: [Food]
}

// MARK: - Food
struct Food: Codable {
    let foodID: Int
    let foodName: String
    let price: Int
    let foodDescription, foodImageURL: String
    let best: Bool

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case foodName, price, foodDescription
        case foodImageURL = "foodImageUrl"
        case best
    }
}

// MARK: - StoreInfo
struct StoreInfo: Codable {
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

extension StoreInfo {
    static var item: [StoreInfo] = [StoreInfo(storeID: 1, storeTypeID: 1, storeType: "1인분", storeName: "스토어1", deliveryTime: "10분~30분", description: "Store 1 description", minOrderPrice: 10000, deliveryFee: 2000, rate: 4.5, firstImageURL: "url1", secondImageURL: "url2", thirdImageURL: "url3", new: false, couponExist: true)]
}
