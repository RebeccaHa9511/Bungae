//
//  KakaoLoginDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import Foundation
import Alamofire

class KaKaogetJWTManager{
    static let shared = KaKaogetJWTManager()
    
    func checkAccessToken(token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIs.KAKAO_Login
        
        let param : Parameters = [
         "token"   : token

        ]
        
        let dataRequest = AF.request(
                                     url,
                                     method: .get,
                                     parameters: param,
                                     encoding: URLEncoding.default
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
                    print("KaKaoLoginManager에서 failure 발생.ㅜㅜ")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(KakaoJWTResponse.self, from : data)
        else {
            print("KaKaoLoginManager에서 Decode를 실패하였습니다.")
            return .decodeErr
        }
        
        switch status{
        case 200..<300:
            print("KaKaoLoginManager - 통신 성공⭐️⭐️ ")
            return .success(decodedData)
        case 400..<500 :
            print("KaKaoLoginManager - Request Error ")
            return .requestErr(decodedData)
        case 500 :
            print("KaKaoLoginManager - Server Error ")
            return .serverErr
        default :
            print("KaKaoLoginManager - NetWork Fail ")
            return .networkFail
            
            
        }
        
        
    }
    
}
