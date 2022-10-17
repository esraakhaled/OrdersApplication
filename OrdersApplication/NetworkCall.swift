//
//  NetworkCall.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 27/09/2022.
//

import Foundation
import Alamofire

final class NetworkCall{
    
    //MARK: -Constants
    static let shared = NetworkCall()
    //MARK: -Initializers
    private init() {}
    
    //MARK: - Functions
    func fetchData<T: Codable>(url: String, method: HTTPMethod, encoding: ParameterEncoding, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                            print(res)
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    default:
                        let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}



