//
//  SubcategoryData.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import Foundation
import Alamofire

struct SubCategoryDataManager {
    
    static let shared = SubCategoryDataManager()
    
    func getSecondCategoryData(categoryCode: String, count: Int, completion : @escaping (NetworkResult<Any>) -> (Void) ){
     
        let url = APIs.categoryURL + "/" + categoryCode
        
        let header : HTTPHeaders = [
            
            "X-ACCESS-TOKEN" : Keys.KAKAO_JWT

        ]

        let param : Parameters = [

            "page" : count
          

        ]
        
        let dataRequest = AF.request(
            url,
            method: .get,
            parameters: param,
            encoding: URLEncoding.default,
            headers: header
                                    )
        
        dataRequest.responseData{ response in
            debugPrint(response)
            
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else{ return }
                guard let data = response.value else{ return }
               
                completion(judge(status: statusCode, data: data))

            case .failure(let err):
                print("SubCategoryDataManager에서 failure 발생하였습니다.")
                print(err)
                completion(.networkFail)
            }
            
        }
        
        
    }
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SubCategoryData.self, from : data)
        else {
            print("SubCategoryDataManager에서 Decode를 실패하였습니다.")
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
