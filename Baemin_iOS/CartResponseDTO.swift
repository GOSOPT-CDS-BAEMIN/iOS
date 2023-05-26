//
//  CartResponseDTO.swift
//  Baemin_iOS
//
//  Created by 홍유정 on 2023/05/26.
//

import UIKit

// MARK: - Cart Get
struct CartListModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [FoodsList]
}

struct FoodsList: Codable {
    let storeID: Int
    let storeName: String
    let deliveryFee: Int
    let foods: [Food]

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeName, deliveryFee, foods
    }
    
    static let item = [FoodsList(storeID: 1, storeName: "스타벅스", deliveryFee: 3000, foods: [Food(foodID: 1, foodName: "케이크", price: 10000, foodImageURL: "", foodDescription: "맛있다", foodCount: 2)])]
}

struct Food: Codable {
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

/*

struct Datum {
    let storeID: Int
    let storeName: String
    let deliveryFee: Int
    let foods: [Food]

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeName, deliveryFee, foods
    }
}

// MARK: - Food
struct Food {
    let foodID: Int
    let foodName: String
    let price: Int
    let foodImageURL: UIImage
    let foodDescription: String
    let foodCount: Int

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case foodName, price
        case foodImageURL = "foodImageUrl"
        case foodDescription, foodCount
    }
}


extension Datum {
    static let item: [Datum] = [Datum(storeID: 1, storeName: "스타벅스", deliveryFee: 3000, foods: [Food(foodID: 1, foodName: "케이크", price: 10000, foodImageURL: .actions, foodDescription: "맛있다", foodCount: 2)])]
}
*/
