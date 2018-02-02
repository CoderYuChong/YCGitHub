//
//  TrendingControllerViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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

extension TrendingViewController: NetworkAgent {
   fileprivate func loadData() {
//    =java&since=weekly
//
    let trendingRequest =  TrendingRequest(lang: "java")
//    trendingRequest.si
    request(trendingRequest) { (response) in
        if let response = response {
            let trending = response as TrendingList
            
        }
    }
    }

}
