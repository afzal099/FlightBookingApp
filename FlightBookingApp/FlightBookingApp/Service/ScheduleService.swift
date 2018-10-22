//
//  ScheduleService.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class ScheduleService: BaseServiceConnector {
    static let shared = ScheduleService()
    
    var sourceAirport: Airport!
    var destinationAirport: Airport!
    var date: Date!
    
    override func requestURLString() -> String {
        return Constants.kScheduleURL + "\(sourceAirport.IATA ?? "")/\(destinationAirport.IATA ?? "")/\(date.scheduleStringRepresentation())"
    }
    
    override func methodString() -> String {
        return Constants.kGET
    }
    
    override func headers() -> Dictionary<String, String>? {
        var parameters =  Dictionary<String,String>()
        parameters[Constants.kAccept] = Constants.kContentTypeJSON
        parameters[Constants.kAuthorization] = Constants.kAuthorizationValue + " \(Constants.accessToken)"
        return parameters
    }
    
    func fetchData(source: Airport, destination: Airport, date: Date, closure: @escaping (ServiceResponse) -> Void) {
        self.sourceAirport = source
        self.destinationAirport = destination
        self.date = date
        super.fetchData(closure: closure)
    }
}
