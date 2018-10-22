//
//  TokenService.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class TokenService: BaseServiceConnector {
    
    static let shared = TokenService()
    override func requestURLString() -> String {
        return Constants.kTokenURL
    }
    
    override func parameters() -> Dictionary<String,String> {
        var parameters =  Dictionary<String,String>()
        parameters[Constants.kClientIDKey] = Constants.kAppKey
        parameters[Constants.kClientSecretKey] = Constants.kAppSecret
        parameters[Constants.kGrantTypeKey] = Constants.kGrantTypeValue
        return parameters
    }
    
    override func headers() -> Dictionary<String, String>? {
        var parameters =  Dictionary<String,String>()
        parameters[Constants.kContentTypeKey] = Constants.kContentTypeFormEncoded
        return parameters
    }
    
}
