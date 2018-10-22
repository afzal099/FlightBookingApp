//
//  FlightBookingAppTests.swift
//  FlightBookingAppTests
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import XCTest
@testable import FlightBookingApp

class FlightBookingAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAirportsPersistanceRead() {
        let error = AirportDataManager.shared.configure()
        XCTAssert(error == nil, "Error reading archived airports data")
    }
    
    func testAirportsCount() {
        _ = AirportDataManager.shared.configure()
        let airports = AirportDataManager.shared.airports
        XCTAssert(airports?.count == 6074, "Invalid airport count")
    }
    
    func testAirportSearch() {
        _ = AirportDataManager.shared.configure()
        let results = AirportDataManager.shared.filteredAirports(searchKey: "Trivandrum")
        let tvmAirport = results?[0]
        XCTAssert(tvmAirport?.IATA == "TRV", "Search airports failed")
    }
    
    func testScheduleViewModel() {
        
        var departureTime = ScheduledTimeLocal()
        departureTime.dateTime = "2018-10-22T10:30"
        
        var arrivalTime = ScheduledTimeLocal()
        arrivalTime.dateTime = "2018-10-22T22:30"
        
        var departure = Departure()
        departure.airportCode = "TRV"
        departure.scheduledTime = departureTime
        
        var arrival = Arrival()
        arrival.airportCode = "BLR"
        arrival.scheduledTime = arrivalTime
        
        var flight = Flight()
        flight.arrival = arrival
        flight.departure = departure
        
        var schedule = Schedule()
        schedule.flights = [flight]

        
        XCTAssert(schedule.numberOfStopsString == "0 Stop", "Number of stops in ScheduleViewModel failed")
        XCTAssert(schedule.departureTime?.timeRepresentaion() == "10:30", "Departure time in ScheduleViewModel failed")
        XCTAssert(schedule.arrivalTime?.timeRepresentaion() == "22:30", "Arrival time in ScheduleViewModel failed")
        
    }

}
