//
//  WishlistDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import Foundation
import Alamofire

class WishlistDataManager{
    static let shared = WishlistDataManager()
    private init(){}
}

extension WishlistDataManager{
    
    func getWishlist(page: Int, completion: @escaping (NetworkResult<Any>) -> Void) {


        let url = APIs.wishListURL


        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.USER_ONE_JWT

        ]

        let param : Parameters = [
            
            "page" : page

        ]

        let dataRequest = AF.request(
                                     url,
                                     method: .get,
                                     parameters: param,
                                     encoding: URLEncoding.default,
                                     headers: header
                                    )


        dataRequest.validate(statusCode: 200..<500).responseData { (response) in

                debugPrint(response)

                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.value else { return }

                    let networkResult = self.judge(status: statusCode, data: data )

                    completion(networkResult)



                case .failure:
                    print("WishlistDataManager 에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }


    private func judge(status : Int, data : Data) -> NetworkResult<Any> {

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(WishResponse.self, from : data)
        else {
            print("WishlistDataManager 에서 Decode를 실패하였습니다.")
            return .decodeErr
        }

        switch status{
        case 200..<300:
            print("WishlistDataManager - 통신 성공⭐️.")
            return .success(decodedData)
        case 400..<500 :
            print("WishlistDataManager - Request Error 발생했습니다.")
            return .requestErr(decodedData)
        case 500 :
            print("WishlistDataManager - Server Error 발생했습니다.")
            return .serverErr
        default :
            print("WishlistDataManager - NetWork Fail.")
            return .networkFail


        }


    }
    
}
