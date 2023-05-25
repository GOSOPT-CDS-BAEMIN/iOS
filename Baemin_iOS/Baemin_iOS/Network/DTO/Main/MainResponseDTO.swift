//
//  MainResponseDTO.swift
//  Baemin_iOS
//
//  Created by JEONGEUN KIM on 2023/05/25.
//

import Foundation

// MARK: - MainResponseDTO
struct MainResponseDTO {
    let storeID, storeTypeID: Int
    let storeType: StoreType
    let storeName, deliveryTime, description: String
    let minOrderPrice, deliveryFee: Int
    let rate: Double
    let storeImages: [StoreImage]
    let new, couponExist: Bool

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeTypeID = "storeTypeId"
        case storeType, storeName, deliveryTime, description, minOrderPrice, deliveryFee, rate, storeImages, new, couponExist
    }
}

enum StoreImage: String, Codable {
    case url1 = "empty_1"
    case url2 = "empty_2"
    case url3 = "empty_3"
}

enum StoreType: String, Codable {
    case 카페디저트 = "카페.디저트"
}

extension MainResponseDTO {
    static var item: [MainResponseDTO] = [MainResponseDTO(storeID: 1, storeTypeID: 1, storeType: .카페디저트, storeName: "파스타 어때 신촌점", deliveryTime: "10분~30분", description: "룰루룰", minOrderPrice: 10000, deliveryFee: 2000, rate: 4.5, storeImages: [.url1, .url2, .url3], new: true, couponExist: true),
                                          MainResponseDTO(storeID: 2, storeTypeID: 2, storeType: .카페디저트, storeName: "파스타 어때 신촌점", deliveryTime: "10분~30분", description: "룰루룰", minOrderPrice: 10000, deliveryFee: 2000, rate: 4.5, storeImages: [.url1, .url2, .url3], new: true, couponExist: true),
                                          MainResponseDTO(storeID: 3, storeTypeID: 3, storeType: .카페디저트, storeName: "파스타 어때 신촌점", deliveryTime: "10분~30분", description: "룰루룰", minOrderPrice: 10000, deliveryFee: 2000, rate: 4.5, storeImages: [.url1, .url2, .url3], new: true, couponExist: true)
    ]
}
