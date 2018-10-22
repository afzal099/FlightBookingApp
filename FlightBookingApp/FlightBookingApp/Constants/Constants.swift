//
//  Constants.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 21/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import Foundation
import UIKit


enum FBError {
    case InvalidData
    case NoInternet
    case PersistenceError
    case APICommunicationError
    case ConfigError
}

enum InputViewType {
    case Source
    case Destination
    case Date
    case None
}

typealias ServiceResponse = (data: Data?, responseCode: Int?, error: FBError?)

class Constants {
    static let kAirportsDataFileName = "Airports"
    static let kAirportSearchResultCell = "AirportSearchResultCell"
    static let kFlightScheduleListCell = "FlightScheduleListCell"
    
    static let kAirportSearchSegue = "ShowAirportSearchPage"
    static let kFlightScheduleSegue = "ShowScheduleListPage"
    static let kShowMapPageSegue = "ShowMapPage"
    
    static let kLoadingViewWidth: CGFloat = 100.0
    static let kLoadingViewHeight: CGFloat = 100.0
    
    static let kkAirportSearchResultCellHeight: CGFloat = 51

    
    static let kOkButtonTitle = "Ok"
    static let kNoInternetAlertTitle = "No Internet"
    static let kNoInternetAlertBody = "Please check your Internet connection and try again"
    static let kGenericErrorAlertTitle = "Some Error Occured"
    static let kGenericErrorAlertBody = "Some error occured! Please check back again later"
    static let kConfigErrorAlertTitle = "Configuration error"
    static let kConfigErrorAlertBody = "Please restart the application and try again"
    static let kNoScheduleAlertTitle = "No Schedules found"
    static let kNoScheduleAlertBody = "There are no flights between these routes"
    
    static let kAppKey = "td5uvdgmbdvtypjr4ne8ncmm"
    static let kAppSecret = "bXat3JS6ay"
    
    static let kClientIDKey = "client_id"
    static let kClientSecretKey = "client_secret"
    static let kGrantTypeKey = "grant_type"
    static let kGrantTypeValue = "client_credentials"
    
    static var accessToken = ""

    static let kBaseURL = "https://api.lufthansa.com/v1/"
    static let kTokenURL = Constants.kBaseURL + "oauth/token"
    static let kScheduleURL = Constants.kBaseURL + "operations/schedules/"

    
    static let kContentTypeKey = "Content-Type"
    static let kAccept = "Accept"
    static let kAuthorization = "Authorization"

    static let kAuthorizationValue = "Bearer "
    static let kContentTypeFormEncoded = "application/x-www-form-urlencoded"
    static let kContentTypeJSON = "application/json"
    
    static let kPOST = "POST"
    static let kGET = "GET"

    static let kScheduleDateTimeFormat = "yyyy-MM-dd'T'HH:mm"
    static let kAPIInputDateTimeFormat = "yyyy-MM-dd"
    
}
