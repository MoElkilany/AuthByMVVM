//
//  Constant.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//

import Foundation
import Alamofire

struct Constants {
    
    struct ProductionServer {
        static let baseURL = "https://ejar.aait-sa.com/api/"
    }
    
    
    struct APIParameterKey {
        static let phone = "phone"
        static let name = "name"
        static let password = "password"
        static let deviceType = "device_type"
        static let deviceID = "device_id"

    }
    
    enum InternetConnection :String {
        case noInternet = "Internet Connection Faild"
    }
    
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case lang = "lang"
}

enum ContentType: String {
    case json = "application/json"
    case deviceType = "ios"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
    case bodyAndURL(body:Parameters , url:Parameters)
}

enum alertButton : String {
    case ok = "Ok"
    case dismiss = "Dismiss"
}

enum alertTitle : String {
    case sucess = "Success"
    case error = "Error"
    case serverError = "Server Error"
    case noDataFound = "There is no Data Found"
    case logout = "Logout successfully"
    case dontHaveSubsection = "You Don't have Subsection Please Add Subsection"
}

enum UserDefaultsKeys : String {
    case home = "home"
    case userData = "userData"
}


