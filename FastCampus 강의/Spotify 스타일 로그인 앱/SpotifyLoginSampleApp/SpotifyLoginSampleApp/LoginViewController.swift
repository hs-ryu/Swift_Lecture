//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by ryu hyunsun on 2024/01/17.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var GoogleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        [emailLoginButton, GoogleLoginButton, appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
        // 네비게이션 바 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: Any) {
    }
    
}
