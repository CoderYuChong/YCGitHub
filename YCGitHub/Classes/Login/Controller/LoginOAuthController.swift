//
//  WebViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class LoginOAuthController: UIViewController {

    lazy var webView: UIWebView = {
        let webView = UIWebView()
        return webView
    }()
    
    var requestString: String = "https://github.com/login/oauth/authorize?client_id=" + clientID + "&scope=user,public_repo,notifications"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        setUpWebView()

        // Do any additional setup after loading the view.
    }
    private func setUpWebView() {
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        guard let url = URL(string: requestString) else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.delegate = self
        cleanCacheAndCookie()
        webView.loadRequest(request)
    }
    private func cleanCacheAndCookie() {
    // 清除cookie
        let storage = HTTPCookieStorage.shared
        guard let cookies = storage.cookies else {
            return
        }
        for cookie in cookies {
            storage.deleteCookie(cookie)
        }
        let cache =  URLCache.shared
        cache.removeAllCachedResponses()
        cache.diskCapacity = 0
        cache.memoryCapacity = 0
    }

    
}

extension LoginOAuthController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url?.absoluteString ?? "---")
        if request.url?.scheme == urlScheme {
            guard let code = request.url?.absoluteString.urlOfKey(key: "code") else {
                return false
            }
            
            loadAccessToken(code)
            return false
        }

        return true
    }
}

extension LoginOAuthController: NetworkAgent {
    func loadAccessToken(_ code: String) {
        request(LoginRequest(code: code)) { (response) in
            if let access_token = response?.access_token  {
                printLog(access_token)
                KeychainTool.setAccessToken(username: access_token, password: "x-oauth-basic")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
