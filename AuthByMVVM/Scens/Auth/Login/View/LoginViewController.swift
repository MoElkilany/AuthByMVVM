//
//  LoginViewController.swift
//  AuthByMVVM
//
//  Created by Mohamed Elkilany on 12/06/2021.
//

import UIKit

class LoginViewController: UIViewController {

    var mainView: LoginView {
        return view as! LoginView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.passwordTF.text = "123456"
    }


  
}
