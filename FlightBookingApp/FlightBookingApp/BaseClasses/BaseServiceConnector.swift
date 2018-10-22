//
//  BaseServiceConnector.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation
import Alamofire


class BaseServiceConnector  {
        
    func fetchData(closure:@escaping (ServiceResponse) -> Void) {
        if Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable ?? false {
            Alamofire.request(self.requestURLString(), method: self.method(), parameters: self.parameters(),encoding: self.encoding(), headers: self.headers()).responseJSON {
 response in
                if response.error != nil {
                    closure((nil,response.response?.statusCode,FBError.APICommunicationError))
                }
                else {
                    if let data = response.data {
                        closure((data,response.response?.statusCode,nil))
                    }
                    else {
                        closure((nil,response.response?.statusCode,FBError.InvalidData))
                    }
                }
            }
        }
        else {
            closure((nil,nil,FBError.NoInternet))
        }
    }
    
    func requestURLString() -> String {
        return Constants.kTokenURL
    }
    
    func parameters() -> Dictionary<String,String>? {
        return nil
    }
    
    func headers() -> Dictionary<String,String>? {
        return nil
    }
    
    private func method() -> HTTPMethod {
        return HTTPMethod(rawValue: self.methodString()) ?? HTTPMethod.post
    }
    
    private func encoding() -> ParameterEncoding {
        if !self.contentIsJSON() {
            return URLEncoding.default
        }
        return JSONEncoding.default
    }
    
    func contentIsJSON() -> Bool {
        return false
    }
    
    func methodString() -> String {
        return Constants.kPOST
    }
    
}
