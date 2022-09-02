//
//  WishListDataResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import Foundation

// MARK: - Welcome
struct WishResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [WishResult]
}

// MARK: - Result
struct WishResult: Codable {
    let itemIdx: String
    let image: String
    let name, price, safePay, storeName: String
    let storeImg: String
    let updatedAt: String
}
