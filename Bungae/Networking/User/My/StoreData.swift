//
//  StoreData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/29.
//

import Foundation

struct StoreData :Codable {
        let storeID, storeName: String
        let isCertificated: Bool
        let storeImage: String
        let rating, wishLists, reviews, followers: String
        let followings, soldCount, contactStart, contactEnd: String
        let precaution, policy, welcomeDescription, openDate: String
        let hit: String
        let itemsResponses: [ItemsData]
        let reviewsResponses: [ReviewsResponse]
        let inquiryResponses: [InquiryResponse]

        enum CodingKeys: String, CodingKey {
            case storeID = "storeId"
            case storeName, isCertificated, storeImage, rating, wishLists, reviews, followers, followings, soldCount, contactStart, contactEnd, precaution, policy
            case welcomeDescription = "description"
            case openDate, hit, itemsResponses, reviewsResponses, inquiryResponses
        }
    }

    struct InquiryResponse: Codable {
        let name: String
        let image: String
        let post, date: String
    }


    struct ItemsData: Codable {
        let itemIdx, itemName, price, location: String
        let image: String
        let time: String
    }


    struct ReviewsResponse: Codable {
        let reviewerName: String
        let reviewerImage: String
        let post, rating, date: String
    }

    

