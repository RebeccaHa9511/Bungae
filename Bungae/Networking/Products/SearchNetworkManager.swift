//
//  SearchNetworkManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/26.
//

import UIKit
import Alamofire

struct SearchNetworkManager {
    
    static let shared = SearchNetworkManager()
    
    
    func getProduct(name: String, count: Int, completion: @escaping (NetworkResult<Any>) -> Void) {


        let url = APIs.searchURL

        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.KAKAO_JWT

        ]

        let param : Parameters = [

            "name" : "\(name)",
            "page" : count

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
                    print("SearchNetworkManager 에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }


    private func judge(status : Int, data : Data) -> NetworkResult<Any> {

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(SearchResponses.self, from : data)
        else {
            print("SearchNetworkManager 에서 Decode를 실패하였습니다.")
            return .decodeErr
        }

        switch status{
        case 200..<300:
            print("SearchNetworkManager - 통신 성공했습니다.")
            return .success(decodedData)
        case 400..<500 :
            print("SearchNetworkManager - Request Error 발생했습니다.")
            return .requestErr(decodedData)
        case 500 :
            print("SearchNetworkManager - Server Error 발생했습니다.")
            return .serverErr
        default :
            print("SearchNetworkManager - NetWork Fail 입니다.")
            return .networkFail


        }


    }
    
    
    
    
}
