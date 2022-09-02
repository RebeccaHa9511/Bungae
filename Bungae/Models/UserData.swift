//
//  UserData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/23.
//

import Foundation

struct User : Codable{
    
    static var shared = User()
    
    
    var id : String?
    var password : String?
    var username : String?
    var location : String?
    //let date : Date?
    var phoneNum : String?
    
    var userId : String = "1"
    var jwtToken : String = "Default JWT Token"
    var loginSelected : Bool = false
    
    private init(){}
    
}
