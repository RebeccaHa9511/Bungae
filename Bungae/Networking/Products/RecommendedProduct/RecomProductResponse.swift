//
//  RecomProductResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Foundation

struct RecomProductResponse : Codable {
    
    let isSuccess : Bool
    let code : Int
    let message : String
    let result : [ProductDataResult]?
    
}
