//
//  ProductDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Foundation
import Alamofire

class ProductDataManager{
    static let shared = ProductDataManager()
    
    private init(){}

    
    func getProduct(idx: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
        let url = APIs.productURL + "/" + idx
        
        
        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.KAKAO_JWT

        ]
        
        let dataRequest = AF.request(
                                     url,
                                     method: .get,
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
                    print("ProductDataManager -failure 발생하였습니다.👽👽👽👽")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(ProductDataResponse.self, from : data)
        else {
            print(" ProductDataManager - Decode를 실패하였습니다.🎅🎅🎅🎅")
            return .decodeErr
        }
        
        switch status{
        case 200..<300:
            print(" ProductDataManager - 통신 성공 💡")
            return .success(decodedData)
        case 400..<500 :
            print("ProductDataManager - Request Error 💡💡")
            return .requestErr(decodedData)
        case 500 :
            print(" ProductDataManager - Server Error 💡💡💡")
            return .serverErr
        default :
            print("ProductDataManager -  NetWork Fail 💡💡💡💡")
            return .networkFail
            
            
        }
        
        
    }
    

}
