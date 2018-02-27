//
//  RepositoriesViewController.swift
//  YCGitHub
//
//  Created by 余冲 on 2018/2/1.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension NewsViewController: NetworkAgent {
    func loadData() {
        
        request(NewsRequest()) { (response, _) in
            if let response = response {
                self.handleData(response.data)
            }
        }
        
    }
    
    func handleData(_ response: [NewsModelElement]) {
        
        
    }
}
