//
//  DetailVCNetworking.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import Foundation

extension DetailVC {
     func getAllRecomProducts(){
        ProductDataManager.shared.getProduct(idx: detailidx) { (response) in
            switch response {

            case .success(let data) :

                let responseData = data as! ProductDataResponse

                if responseData.isSuccess {
                    self.setImageData(responseData)
                    print("Response 성공했습니다🌷")
                } else {
                    self.presentBottomAlert(message: "Bottom 입니다🌷")
                }



            case .requestErr(let msg):
                print(msg)
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }

    }
    
    func getUserProducts(){
        UserProductDataManager.shared.getUserProduct(condition: "Y" ) { (response) in
            switch response {
            case .success(let data) :
                let responseData = data as! UsersProduct
                    self.setupUserProduct(responseData)
                
                self.resizeCV()
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }
    }
    
    func postHeart(){
        AddtoWishManager.shared.addtoWishList(itemIdx: detailidx)  { (response) in
            switch response {

            case .success(let data) :
                let responseData = data as! AddtoWishResponse
                self.getAllRecomProducts()
            case .requestErr(let msg):
                self.presentBottomAlert(message: msg as! String)
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }
        
    }
    
    func deleteHeart(){
        RemoveWishManager.shared.removefromWishList(itemIdx: detailidx)  { (response) in
            switch response {

            case .success(let data) :
                let responseData = data as! AddtoWishResponse
                self.getAllRecomProducts()
            case .requestErr(let msg):
                self.presentBottomAlert(message: msg as! String)
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }
        
    }
    
}
