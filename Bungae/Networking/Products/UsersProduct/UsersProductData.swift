//
//  UsersProductData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import Foundation


struct UsersProductData: Codable {
    let itemIdx, itemName, price, location: String
    let image: String
    let time: String
}

typealias UsersProduct = [UsersProductData]
