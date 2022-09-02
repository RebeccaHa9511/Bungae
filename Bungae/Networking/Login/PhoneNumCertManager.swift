//
//  PhoneNumCertManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import Foundation
import Alamofire

class PhoneNumCertManager {
    
    //Singleton
    static let shared = PhoneNumCertManager()
    
    private init(){}
    
    func postPhonenumber(phoneNumber: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIs.loginURL + "/sms" + "/auth"

        
        let header : HTTPHeaders = [
          
        ]
        
        
        let param : Parameters = [
            "phoneNumber": phoneNumber

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
                    
                    let headerFields = response.response?.allHeaderFields as! [String: String]
                       let url = response.response?.url
                       let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url!)
                       var cookieArray = [[HTTPCookiePropertyKey: Any]]()
                       for cookie in cookies {
                           cookieArray.append(cookie.properties!)
                       }
                       UserDefaults.standard.set(cookieArray, forKey: "savedCookies")
                       UserDefaults.standard.synchronize()
                    
                    
                    
                case .failure:
                    print("PhoneNumCertManager에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(PhoneNumCertResponse.self, from : data)
        else {
            print("PhoneNumCertManager에서 Decode를 실패하였습니다.")
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
