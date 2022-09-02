//
//  ProfileData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/23.
//

import Foundation

struct ProfileData: Codable {
    let storeID, storeName: String
    let isCertificated: Bool
    let storeImage: String
    let wishLists, reviews, followers, followings: String
    let itemsResponses: [ItemsResponse]

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case storeName, isCertificated, storeImage, wishLists, reviews, followers, followings, itemsResponses
    }
}

// MARK: - ItemsResponse
struct ItemsResponse: Codable {
    let itemIdx, itemName, price, location: String
    let image: String
    let time: String
}
