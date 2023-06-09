//
//  CartResponseDTO.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/26.
//

import UIKit

// MARK: - Cart Get
struct CartResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [FoodsList]
}

struct FoodsList: Codable {
    let storeID: Int
    let storeName: String
    let deliveryFee: Int
    let foods: [FoodItem]

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeName, deliveryFee, foods
    }
}

struct FoodItem: Codable {
    let foodID: Int
    let foodName: String
    let price: Int
    let foodImageURL, foodDescription: String
    let foodCount: Int

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case foodName, price
        case foodImageURL = "foodImageUrl"
        case foodDescription, foodCount
    }
}

    // MARK: - Delete Food
struct DeleteModel: Codable {
    let foodIds: [Int]
}
