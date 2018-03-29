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
        KeychainTool.clearAccessToken()
        loginButton.setBackgroundImage(UIImage(color: themeColor, size: loginButton.bounds.size), for: .normal)
        loginButton.setBackgroundImage(UIImage(color: UIColor("0x3bbc79", alpha: 0.5), size: loginButton.bounds.size), for: .disabled)
        setupTextField()
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
    deinit {
        print("---LoginViewController-----")
    }


}

extension LoginViewController {
    
    private func setupTextField() {
        let att = [NSAttributedStringKey.foregroundColor: UIColor("ffffff", alpha: 0.5),NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]
        accountTextField.attributedPlaceholder = NSAttributedString(string: "手机号码/电子邮件", attributes: att)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "密码", attributes: att)
        passwordTextField.addTarget(self, action: #selector(textValueChanged), for: .editingChanged)
        accountTextField.addTarget(self, action: #selector(textValueChanged), for: .editingChanged)
        
        accountTextField.text = KeychainTool.account()
        passwordTextField.text = KeychainTool.password()
    }
    
    private func backgroundImage() {
        let bgImage = R.image.login_bg()?.applyBlur(withRadius: 30, tintColor: UIColor(white: 1.0, alpha: 0.3), saturationDeltaFactor: 1.8, maskImage: nil)
        loginBackgroundImageView.image = bgImage
    }
    
    private func loginSuccess() {
        KeychainTool.setAccount(accountTextField.text!)
        KeychainTool.setPassword(passwordTextField.text!)
        self.dismiss(animated: true, completion: nil)
        UIApplication.shared.delegate?.window??.rootViewController = MainTabBarViewController()
    }
}

extension LoginViewController: NetworkAgent {
    func loadProfileData() {
        YCHUD.showLoding()
        request(ProfileRequest()) { (response, _) in
            YCHUD.hudHide()
            if response != nil {
                self.loginSuccess()
            } else {
                KeychainTool.clearAccessToken()
            }
        }
    }

}

extension LoginViewController {
    @objc func  textValueChanged() {
         loginButtoonEnable()
    }
    
    private func loginButtoonEnable() {
        if (accountTextField.text?.count != 0) && (passwordTextField.text?.count != 0){
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
            
        }
    }
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
        let aa = KeychainTool.accessToken()
        print(aa)
        loadProfileData()
    }
    
    
    @IBAction func OAuthloginClick(_ sender: Any) {
//        let loginVC = LoginOAuthController()
//
//        loginVC.loginResult = { success in
//            self.loadProfileData()
//        }
        let loginVC = Routing.loginOAuthController { (success) in
             self.loadProfileData()
        }
//
//        loginVC.loginResult = { success in
//            self.loadProfileData()
//        }

        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
