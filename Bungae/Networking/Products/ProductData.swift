//
//  ProductData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//


import Foundation

struct ProductDataResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProductDataResult
}

// MARK: - Result
struct ProductDataResult: Codable {
    let idx, price, name, location: String
    let time, hit, stock, wish: String
    let chat: String
    let delivery, exchange: Bool
    let content, category, brand, seller: String
    let status: String
    let tags: [String]
    let images: [String]
    let new: Bool
}
