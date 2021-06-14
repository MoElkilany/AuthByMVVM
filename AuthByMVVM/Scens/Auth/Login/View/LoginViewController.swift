//
//  LoginViewController.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//

import UIKit
import RxSwift
import RxCocoa


class LoginViewController: UIViewController {

    var mainView: LoginView {
        return view as! LoginView
    }
    
    let dispose = DisposeBag()
    let  loginViewModelReference = LoginViewModel()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFieldToViewModel()
        subscribeOnLoginButton()
    }
}


//MARK: bindTextFields
extension LoginViewController {
    func bindTextFieldToViewModel(){
        mainView.phoneTF.rx.text.orEmpty.bind(to: loginViewModelReference.phoneBehavior).disposed(by: dispose)
        mainView.passwordTF.rx.text.orEmpty.bind(to: loginViewModelReference.passwordBehavior).disposed(by: dispose)
    }
}



//MARK: subscribeOnLoginButton
extension LoginViewController {
    func subscribeOnLoginButton(){
        mainView.loginBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance ).subscribe { (_) in
            print("tapp on login button")
        }.disposed(by: dispose)

    }
}
