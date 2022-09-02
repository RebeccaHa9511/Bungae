//
//  RecomProductDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Foundation
import Alamofire

class RecomProductDataManager{
    static let shared = RecomProductDataManager()
    private init(){}
}

extension RecomProductDataManager{
    
    func getProduct(idx: String, completion: @escaping (NetworkResult<Any>) -> Void) {


        let url = APIs.productURL + "/" + idx


        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.KAKAO_JWT

        ]

        let param : Parameters = [

            :

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
                    print("RecomProductDataManager 에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }


    private func judge(status : Int, data : Data) -> NetworkResult<Any> {

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(RecomProductResponse.self, from : data)
        else {
            print("RecomProductDataManager 에서 Decode를 실패하였습니다.")
            return .decodeErr
        }

        switch status{
        case 200..<300:
            print("RecomProductDataManager - 통신 성공했습니다.")
            return .success(decodedData)
        case 400..<500 :
            print("RecomProductDataManager - Request Error 발생했습니다.")
            return .requestErr(decodedData)
        case 500 :
            print("RecomProductDataManager - Server Error 발생했습니다.")
            return .serverErr
        default :
            print("RecomProductDataManager - NetWork Fail 입니다.")
            return .networkFail


        }


    }
    
}
