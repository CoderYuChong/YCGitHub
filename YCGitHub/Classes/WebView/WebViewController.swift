//
//  WebViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/6.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    lazy var webView: UIWebView = {
        let webView = UIWebView()
        return webView
    }()
    
    var requestString: String = "https://github.com/login/oauth/authorize?client_id=" + clientID + "&scope=user:email"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        guard let url = URL(string: requestString) else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.delegate = self
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.url?.absoluteString ?? "---")
        if request.url?.scheme == urlScheme {
            guard let code = request.url?.absoluteString.urlOfKey(key: "code") else {
                return false
            }
             printLog(code)
            
           let codeUrl = "https://github.com/login/oauth/access_token?client_id=\(clientID)&client_secret=\(clientSecret)&code=\(code)redirect_uri=YCGithub://github.com/CoderYuChong"
            guard let url = URL(string: codeUrl) else {
                return false
            }
            
            let request = URLRequest(url: url)
            webView.loadRequest(request)
            
            return false
        }

        return true
    }
}
