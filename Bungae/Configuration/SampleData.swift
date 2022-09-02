//
//  SampleData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import Foundation

struct SampleData {
    static var shared = SampleData()
    
    var loginID = "user1"
    var loginPassworkd = "user1passwd"
    var storeName = "미둥등"
    
    
    var name = "Rebecca Ha"
    var phoneNum = "01011112222"
    var height = 400
    
    private init() {}
    
}
