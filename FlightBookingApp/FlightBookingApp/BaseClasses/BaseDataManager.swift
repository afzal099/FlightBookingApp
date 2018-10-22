//
//  BaseDataManager.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class BaseDataManager {
    
    // Generic method to parse JSON
    func process<T: Codable>(response: ServiceResponse, type: T.Type) -> (data: T?,error: FBError?) {
        if let error = response.error {
            return (nil,error)
        }
        else {
            if let data = response.data {
                do {
                    let parsedOject = try JSONDecoder().decode(type, from: data)
                    return (parsedOject,nil)
                }
                catch {
                    return (nil,FBError.InvalidData)
                }
            }
            return (nil,FBError.APICommunicationError)
        }
        
    }
    
}
