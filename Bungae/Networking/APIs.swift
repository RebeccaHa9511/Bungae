//
//  APIs.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Foundation

struct APIs {
    
    // MARK: - BASE LAYER
    static let BASE_URL = ""
    static let DOMAIN_URL = "https://makaroni.shop"
    

    // MARK: - 2nd LAYER
    //LOGIN
     static let userURL = DOMAIN_URL + "/users"
    
    //PRODUCT
     static let productURL = DOMAIN_URL + "/items"
     static let brandURL = DOMAIN_URL + ""
     static let searchURL = DOMAIN_URL + "/items" 
     static let followURL = DOMAIN_URL + ""
    static let loginURL = DOMAIN_URL + "/login"
    
     
// MARK: - 3rd LAYER
     
    //USER
     static let signUpURL = userURL + ""
    static let KAKAO_URL = "https://kauth.kakao.com/oauth/authorize"
    static let KAKAO_Login = DOMAIN_URL + "/login" + "/kakao/auth"
     static let profileIndexURL = userURL
     static let wishListURL = productURL + "/wish-lists"
     static let reviewURL = userURL + ""

    static let storeURL = userURL + "/stores"
     
    //FOLLOW
     static let followerURL = followURL + ""
     static let followingURL = followURL + ""
     
    //PRODUCT
     static let categoryURL = productURL + "/category"
     
    //SEARCH
     static let RECENT_Search_URL = searchURL + ""
     static let HOT_Search_URL = searchURL + ""
    
    
// MARK: - 4th LAYER
    static let kakao_Auto_URL = KAKAO_URL + ""
    
}
