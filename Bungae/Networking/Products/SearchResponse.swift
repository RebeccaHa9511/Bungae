//
//  SearchResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/26.
//

import Foundation

struct SearchResponses: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchResponse]?
    
}

struct SearchResponse: Codable {
    let itemIdx : String
    let price : String
    let name : String
    let safePay : Bool
    let image : String
    let status : String
    let ad : Bool
    
    
}


