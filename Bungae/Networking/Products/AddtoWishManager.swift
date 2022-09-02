//
//  AddtoWishManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import Foundation
import Alamofire

struct AddtoWishManager {
    
    static let shared = AddtoWishManager()
    
    func addtoWishList( itemIdx: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIs.wishListURL
        
        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.USER_ONE_JWT

        ]
        
        let param : Parameters = [
            "itemIdx" : Int(itemIdx)
        ]
        
        let dataRequest = AF.request(
            url,
            method: .post,
            parameters: param,
            encoding: JSONEncoding.default,
            headers: header
            
                                    )
        
        var request = URLRequest(url: URL(string:url)!)
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: param, options: [])
               } catch {
                   print("http Body Error")
               }
        
       
        dataRequest.validate(statusCode: 200..<500).responseData { (response) in
            
                debugPrint(response)
                
                switch response.result {
                case .success:
                    
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.value else { return }
             
                    let networkResult = self.judge(status: statusCode, data: data )
                    
                    completion(networkResult)
                    
                case .failure:
                    print("AddtoWishManager에서 failure 발생.ㅜㅜ")
                    completion(.networkFail)
                }
        }
        
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(AddtoWishResponse.self, from : data)
        else {
            print("AddtoWishManager에서 Decode를 실패하였습니다.")
            return .decodeErr
        }
        
        switch status{
        case 200..<300:
            print("AddtoWishManager - 통신 성공⭐️⭐️ ")
            return .success(decodedData)
        case 400..<500 :
            print("AddtoWishManager - Request Error ")
            return .requestErr(decodedData)
        case 500 :
            print("AddtoWishManager - Server Error ")
            return .serverErr
        default :
            print("AddtoWishManager - NetWork Fail ")
            return .networkFail
            
            
        }
        
        
    }
    
}

extension String: ParameterEncoding {

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }

}
