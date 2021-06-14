//
//  Router.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//

import Foundation
import Alamofire



enum Router: URLRequestConvertible {
    case signIn(phone:String,password:String)

   
        // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .signIn:
            return .post
        default:
            return .post
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .signIn: return "sign-in"
        }
    }
    
    // MARK: - Parameters
    private var parameters: RequestParams? {
        let constants = Constants.APIParameterKey.self
        switch self {
        
    
        case.signIn( let phone,let  password):return.body([
                                                            constants.phone:phone ,                   constants.password:password,
                                                            constants.deviceID:"eXQB32AiSWOF5QsssoG2ug:APA91bGt7QBOcKYhte_JEofxcF350BZiPDfgQU36MY_WmUT2Y1ImyUxYQn-qgwvr-hPYGx1apMf3eKauAXxxemSWRB6_i3aGQ6lo1dhJDskgkxG55-du9jUvKiXRkhSdE92SE1YXbHw6",
                                                            constants.deviceType :"ios"])
            
      default:return nil
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.ProductionServer.baseURL.asURL()
//        let lang = HelperTools.currentLanguage()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        urlRequest.setValue("en", forHTTPHeaderField: HTTPHeaderField.lang.rawValue)
    
        
        if let parameters = parameters {
            switch parameters {
            case .body(let parameters):
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
                
                
            case .url(let parameters):
                let queryParams = parameters.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
                
            case .bodyAndURL(let bodyParameters, let urlParameters):
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
                
                let queryParams = urlParameters.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
            }
            
            print("The API Parameter is = \(parameters)")
        }
        print("urlRequest = \(String(describing: urlRequest.headers)) and component = \(String(describing: urlRequest.allHTTPHeaderFields))  , \(String(describing: urlRequest.httpMethod)), \(String(describing: urlRequest.url))  , \(String(describing: urlRequest.httpBody))" )
        return urlRequest
    }
}


