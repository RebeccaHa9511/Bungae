//
//  LoginDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import Foundation
import Alamofire

struct LoginDataManager {

    //SINGLETON
    static let shared = LoginDataManager()
    
    func startlogin(loginId: String, password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIs.loginURL

        
        let header : HTTPHeaders = [
          
        ]
        
        
        let param : Parameters = [
            "loginId": loginId,
            "password": password,
                
        ]
    
        
        
        let dataRequest = AF.request(
                                     url,
                                     method: .post,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header
                                     
                                    )
        
        
        dataRequest.validate(statusCode: 200..<500).responseData { (response) in
            
                debugPrint(response)
                
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let value = response.value else { return }
                    
                    let networkResult = self.judge(status: statusCode, data: value )
                    
                    completion(networkResult)
                    
                    
                    
                case .failure:
                    print("SIGNUP DATAMANAGER에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginData.self, from : data)
        else {
            print("SIGNUP DATAMANAGER에서 Decode를 실패하였습니다.")
            return .decodeErr
        }
        
        switch status{
        case 200..<300:
            return .success(decodedData)
        case 400..<500 :
            return .requestErr(decodedData)
        case 500 :
            return .serverErr
        default :
            return .networkFail
            
            
        }
        
        
    }
    


}
