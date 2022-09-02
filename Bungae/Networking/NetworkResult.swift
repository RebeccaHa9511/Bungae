//
//  NetworkResult.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Foundation

//실패 성공 
enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    case decodeErr
    
}
