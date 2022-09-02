//
//  TextAuthManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/09/01.
//

import Foundation
import Alamofire

struct TextAuthManager {
    
    //Singleton
    static let shared = TextAuthManager()
    
    private init(){}
    
    func getAuth(authNumber: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIs.loginURL + "/sms"

    
            guard let cookieArray = UserDefaults.standard.array(forKey: "savedCookies") as? [[HTTPCookiePropertyKey: Any]] else { return }
            for cookieProperties in cookieArray {
                if let cookie = HTTPCookie(properties: cookieProperties) {
                    HTTPCookieStorage.shared.setCookie(cookie)
                }
            }
        
        
        
        let header : HTTPHeaders = [
            "Cookies" : "\(cookieArray)"
        ]
        
        
        let param : Parameters = [
            "authNumber": authNumber

        ]
        
        

        let dataRequest = AF.request(
                                     url,
                                     method: .get,
                                     parameters: param,
                                     encoding: URLEncoding.default,
                                     headers: header
                                    )
        
        
        dataRequest.validate(statusCode: 200..<500).responseData { (response) in
            
           
                
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let value = response.value else { return }
                    
                    let networkResult = self.judge(status: statusCode, data: value )
                    
                    completion(networkResult)
                    
                    
                    
                case .failure:
                    print("TextAuthManager에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(TextAuthResponse.self, from : data)
        else {
            print("TextAuthManager에서 Decode를 실패하였습니다.T_T")
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
