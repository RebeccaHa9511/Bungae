//
//  KakaoLoginResponse.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import Foundation

struct KakaoJWTResponse: Codable {
    
    let code : String
    let message : String
    let jwt : String
    
}
