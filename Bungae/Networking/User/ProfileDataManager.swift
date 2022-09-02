//
//  ProfileDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/23.
//

import Foundation
import Alamofire

class ProfileDataManager{
    
    //SINGLETON
    static let shared = ProfileDataManager()
    
    func getmyProfile(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
        let url = APIs.profileIndexURL
        
        
        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.USER_ONE_JWT

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
             
                    let networkResult = self.errorDistiction(status: statusCode, data: data )
                    
                    completion(networkResult)
                    
                case .failure:
                    print("ProfileDataManager 에서 failure 발생하였습니다.")
                    completion(.networkFail)
                }
        }
    }
    
    
    private func errorDistiction(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(ProfileData.self, from : data)
        else {
            print("ProfileDataManager 에서 Decode를 실패하였습니다.")
            return .decodeErr
        }
        
        switch status{
        case 200..<300:
            print("ProfileDataManager - 통신 성공했습니다.")
            return .success(decodedData)
        case 400..<500 :
            print("ProfileDataManager - Request Error 발생했습니다.")
            return .requestErr(decodedData)
        case 500 :
            print("ProfileDataManager - Server Error 발생했습니다.")
            return .serverErr
        default :
            print("ProfileDataManager - NetWork Fail 입니다.")
            return .networkFail
            
            
        }
        
        
    }
    
}
