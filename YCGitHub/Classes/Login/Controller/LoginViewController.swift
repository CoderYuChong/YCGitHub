//
//  LoginViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/8.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import UIImage_BlurredFrame



class LoginViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginBackgroundImageView: UIImageView!
    
    @IBOutlet weak var OAuthLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        OAuthLoginButton.setTitleColor(UIColor(white: 1.0, alpha: 0.5), for: .normal)
//        OAuthLoginButton.setTitleColor(UIColor(white: 0.5, alpha: 0.5), for: .normal)
        loginButtoonEnable()
        backgroundImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

extension LoginViewController {
    
    private func backgroundImage() {
        let bgImage = R.image.login_bg()?.applyBlur(withRadius: 30, tintColor: UIColor(white: 1.0, alpha: 0.3), saturationDeltaFactor: 1.8, maskImage: nil)
        loginBackgroundImageView.image = bgImage
    }

    private func loginButtoonEnable() {
        if (passwordTextField.text?.isEmpty)! && (accountTextField.text?.isEmpty)! {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }
    
    private func loginSuccess() {
        
    }
}

extension LoginViewController: NetworkAgent {
    func loadProfileData() {
        request(ProfileRequest()) { (response) in
            if let response = response {
                printLog("----ProfileRequest----")
                self.loginSuccess()
            }
        }
    }

}

extension LoginViewController: UITextFieldDelegate {
    
}

extension LoginViewController {
    @IBAction func login(_ sender: Any) {
        print("---LoginViewController---")
        guard let account = accountTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        KeychainTool.setAccessToken(username: account, password: password)
        loadProfileData()
    }
    
    
    @IBAction func OAuthloginClick(_ sender: Any) {
        
        self.navigationController?.pushViewController(LoginOAuthController(), animated: true)
    }
}
