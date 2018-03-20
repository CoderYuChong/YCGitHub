//
//  FileContentViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class FileContentViewController: UIViewController {
    var htmlUrl: String = ""
    
    lazy var webView: UIWebView = {
       let webView = UIWebView(frame: self.view.bounds)
        webView.scalesPageToFit = true
        webView.delegate = self
        return webView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(webView)
        
        guard let url = URL(string: htmlUrl) else {
            YCHUD.show(title: "链接无效")
            return
        }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
    }

}

extension FileContentViewController: UIWebViewDelegate {
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url?.absoluteString
        printLog(url)
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
//        let hiddenjs = "var hidden = function (){var js = document.getElementsByTagName(\"div\");for (var i = 0;i<js.length; i++) {var temp = js[i];if (temp.className == \"repository-content\") {temp.style.visibility=\"visible\"} else  {temp.style.visibility=\"hidden\"}}}"
//        webView.stringByEvaluatingJavaScript(from: hiddenjs)
//        webView.stringByEvaluatingJavaScript(from: "hidden()")
        printLog("webViewDidFinishLoad")

        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        printLog(error.localizedDescription)
    }
}


