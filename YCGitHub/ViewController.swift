//
//  ViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor("FE54000")
        
        NotificationCenter.default.post(name: Notification.Name.UserNotification.DidCancel, object: nil)
        
        UserDefaults.Account.set(value: "jake", forKey: .name)
       let _ = UserDefaults.Account.string(forkey: .name)
//        URLSessionClient.shared.send(<#T##r: Request##Request#>, hander: <#T##(Decodable?) -> Void#>)
     
//        send(<#T##r: BaseRequest##BaseRequest#>, hander: <#T##(Decodable?) -> Void#>)
        
    }


}

