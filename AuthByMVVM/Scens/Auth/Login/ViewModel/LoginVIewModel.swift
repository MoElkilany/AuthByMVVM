//
//  LoginVIewModel.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 14/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    var phoneBehavior = BehaviorRelay<String>(value: "")
    var passwordBehavior = BehaviorRelay<String>(value: "")
    
   private var loginModelSubject = PublishSubject<UserModelResponse>()
    var loginModelObservable : Observable <UserModelResponse> {
        return loginModelSubject
    }
    
}

//MARK: Hit login network
extension LoginViewModel {
    func loginNetwork(){
        NetworkManager.loginNetwork(phoneNumber: phoneBehavior.value, password: passwordBehavior.value) { respons in
            switch respons {
            case .success(let responseValue):
                print("responseValue" , responseValue)
                self.loginModelSubject.onNext(responseValue)
            case .failure(let error):
                print("error",error)
            }
        }
    }
}
