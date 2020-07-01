//
//  Service.swift
//  AlamofireTest2
//
//  Created by Yuki Shinohara on 2020/07/01.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    fileprivate var baseUrl = ""
    
    typealias countriesCallBack = (_ countries:[Country]?, _ status: Bool, _ message: String) -> Void
    var callback: countriesCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getAllCountryNameFrom(endPoint: String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
//            print(responseData)
            guard let data = responseData.data else {
                self.callback?(nil, false, "")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: data)
//                print(countries)
                self.callback?(countries, true, "")
            } catch {
//                print(error)
                self.callback?(nil, false, error.localizedDescription)
            }
            
        }
            
        }
    
    func completionHandler(callback: @escaping countriesCallBack){
        self.callback = callback
    }
    
}
