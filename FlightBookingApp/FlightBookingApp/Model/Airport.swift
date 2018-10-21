//
//  Airport.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

struct Airport : Codable{
    
    var airportID: String?
    var name: String?
    var city: String?
    var country: String?
    var IATA: String?
    var ICAO: String?
    var latitude: Double?
    var longitude: Double?
    var altitude: Double?
    
    private enum CodingKeys: String, CodingKey {
        case airportID
        case name
        case city
        case country
        case IATA
        case ICAO
        case latitude
        case longitude
        case altitude
    }
    
    func searchTags() -> String {
        return "\(self.name ?? "") \(self.city ?? "") \(self.country ?? "") \(self.IATA ?? "") \(self.ICAO ?? "")"
    }
    
}
