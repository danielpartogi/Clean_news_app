//
//  NetworkCall.swift
//  cermatiTest
//
//  Created by daniel on 14/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation
import Alamofire

class NetworkCall: NSObject {
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = Constants.Server.baseURL
    var encoding: ParameterEncoding = URLEncoding.queryString
    
    init(data: [String:Any],headers: [String:String] = [:],url :String?, method: HTTPMethod = .get,encoder: ParameterEncoding? = nil){
        super.init()
        if let encode = encoder {
          encoding = encode
        }
        parameters = data
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        self.url = Constants.Server.baseURL + (url ?? (""))
        self.method = method
    }
    
    func request<T>(completion: @escaping (Result<T,Error>) -> Void) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    default:
                        var errorString: String?
                      if let data = response.data {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                               errorString = json["message"]
                           }
                        
                      }
                        let error = NSError(domain: errorString ?? response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
