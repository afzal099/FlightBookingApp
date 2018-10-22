//
//  Schedule.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation
import MapKit

struct Schedule : Codable {
    var totalJourney: FlightDuration?
    var flights: [Flight]?
    private enum CodingKeys: String, CodingKey {
        case totalJourney = "TotalJourney"
        case flights = "Flight"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalJourney = try container.decode(FlightDuration.self, forKey: .totalJourney)
        
        // The JSON is bad sometimes fligt is an object otherwise it an array
        do {
            self.flights = try container.decode([Flight].self, forKey: .flights)
        } catch DecodingError.typeMismatch {
            let flight = try container.decode(Flight.self, forKey: .flights)
            self.flights = [flight]
        }
    }
    
    init() {
        
    }

}

extension Schedule : FlightScheduleViewModel {
    
    var departureTime: Date? {
        get {
            if let flight = self.flights?.first {
                return flight.departure?.scheduledTime?.dateTime?.scheduleTime()
            }
            return nil
        }
    }
    
    var arrivalTime: Date? {
        get {
            if let flight = self.flights?.last {
                return flight.arrival?.scheduledTime?.dateTime?.scheduleTime()
            }
            return nil
        }
    }
    
    var numberOfStopsString: String? {
        get {
            if let flights = self.flights {
                return "\(flights.count - 1) Stop"
            }
            return nil
        }
    }
    
}
