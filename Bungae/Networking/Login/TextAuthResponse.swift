//
//  TextAuthResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/09/01.
//

import Foundation

struct TextAuthResponse : Codable {
    
    let code, message: String
    
    let check: Bool
    
}
