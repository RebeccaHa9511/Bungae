//
//  CategoryData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import Foundation

struct CategoryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: CategoryResult
}

// MARK: - Result
struct CategoryResult: Codable {
    let name, image: String
}
//
//
//struct Item: Codable {
//    let itemIdx, price, name: String
//    let safePay: Bool
//    let image: String
//    let status: String
//    let ad: Bool
//}

