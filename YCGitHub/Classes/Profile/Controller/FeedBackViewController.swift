//
//  FeedBackViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/3/22.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class FeedBackViewController: UIViewController {
    
    @IBOutlet weak var issueTitleTextField: UITextField!
    
    @IBOutlet weak var issueBodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FeedBack"
        notificationText()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .plain, target: self, action: #selector(submitFeedBack))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func notificationText() {
       
        NotificationCenter.default.addObserver(self, selector: #selector(textFiledValueChange), name: UITextView.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textFiledValueChange), name: UITextField.textDidChangeNotification, object: nil)

    }
    
    @objc private func textFiledValueChange() {
//        self.issueTitleTextField.text?.count
        self.navigationItem.rightBarButtonItem?.isEnabled = (self.issueBodyTextView.text.count != 0 && self.issueTitleTextField.text?.count != 0 )
    }
    
    @objc private func submitFeedBack() {
        print("submitFeedBack")
        guard self.issueBodyTextView.text.count != 0, self.issueTitleTextField.text?.count != 0 else {
            return
        }
        submitRequest()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


extension FeedBackViewController: NetworkAgent {
    private func submitRequest() {
        let feedRequest = FeedBackRequest(issuesTitle: self.issueTitleTextField.text!, issuesBody: self.issueBodyTextView.text)
        request(feedRequest) { (response, _) in
            
        }
        
    }
}





