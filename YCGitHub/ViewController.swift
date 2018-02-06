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
        // Do any additional setup after loading the view, typically fr
    }

    @IBAction func jump(_ sender: Any) {
        self.present(WebViewController(), animated: true, completion: nil)
    }

}

