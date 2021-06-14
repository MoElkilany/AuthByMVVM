//
//  NetworkManager.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//

import Foundation
import Alamofire

class NetworkManager {

    static func loginNetwork(phoneNumber:String,password:String, completion:@escaping (AFResult<UserModelResponse>)->Void){
        AF.request(Router.signIn(phone: phoneNumber, password: password))
            .responseDecodable { (response: AFDataResponse<UserModelResponse>) in
                completion(response.result)
                print("full Response = \(response.result.map({$0}))")
            }
    }
}
