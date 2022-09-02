//
//  SubCateData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/30.
//

import Foundation

struct SubCategoryData: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SubCategoryResponse
}

// MARK: - Result
struct SubCategoryResponse: Codable {
    let subCategory: [SubCateResult]
    let items: [CategoryItem]
}

// MARK: - Item
struct CategoryItem: Codable {
    let itemIdx, price, name: String
    let safePay: Bool
    let image: String
    let status: String
    let ad: Bool
}

struct SubCateResult: Codable {
    let code, name: String
}

