//
//  AddToWishlistResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

struct AddtoWishResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: AddtoWishResult
}

// MARK: - Result
struct AddtoWishResult: Codable {
    let itemIdx: String
}
