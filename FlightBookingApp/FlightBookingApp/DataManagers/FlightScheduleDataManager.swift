//
//  FlightScheduleDataManager.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation

class FlightScheduleDataManager: BaseDataManager {
    static let shared = FlightScheduleDataManager()
    
    // Loads the oAuth token and saves it to Constants
    func configure(closure: @escaping (FBError?) -> Void) {
        TokenService.shared.fetchData() { response in
            
            let processedTuple = self.process(response: response, type: Token.self)
            if let accessToken = processedTuple.data?.accessToken {
                Constants.accessToken = accessToken
                closure(nil)
            }
            else{
                closure(processedTuple.error)
            }

        }
    }
    
    func loadFlightSchedule(source: Airport, destination: Airport, date: Date, closure: @escaping ([Schedule]?, FBError?) -> Void) {
        ScheduleService.shared.fetchData(source: source, destination: destination, date: date) { response in
            
            let processedTuple = self.process(response: response, type: FlightScheduleRoot.self)
            if let schedules = processedTuple.data?.scheduleResource?.schedule {
                closure(schedules,nil)
            }
            else {
                closure(nil,processedTuple.error)
            }

        }
    }
    
}
