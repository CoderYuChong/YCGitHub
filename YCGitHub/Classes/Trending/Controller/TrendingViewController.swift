//
//  TrendingControllerViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/2.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TrendingViewController: TwitterPagerTabStripViewController {

    override func viewDidLoad() {
        settings.style.titleColor = .black
        settings.style.selectedDotColor = .blue;
        settings.style.dotColor = .lightGray;
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        printLog("-------pagerTabStripController--------")
        let repositories = RepositoriesTrendingViewController()
        let develpoer = DevelpoerTrendingViewController();
        return [repositories,develpoer]
    }
    
}


extension TrendingViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationViewController = segue.destination as? MainViewController,
            let languageVC = destinationViewController.topViewController as? LanguageScreeningViewController else {
            return
        }
        
        var selectedLanguage: String?
        var selectedTime: String?
        
        switch self.currentIndex {
        case 0:
            selectedLanguage = UserDefaults.LanguageScreeningRepositories.string(forkey: .language)
            selectedTime = UserDefaults.LanguageScreeningRepositories.string(forkey: .since)
        case 1:
            selectedLanguage = UserDefaults.LanguageScreeningDeveloper.string(forkey: .language)
            selectedTime = UserDefaults.LanguageScreeningDeveloper.string(forkey: .since)
        default:
            selectedLanguage = ""
            selectedTime = ""
        }
        if selectedLanguage?.count == 0 {
            selectedLanguage = "所有语言"
        }
        languageVC.selectedLanguage = selectedLanguage
        languageVC.selectedTime = selectedTime
        languageVC.deleagte = self
    }
}


extension TrendingViewController: LanguageScreeningProtocol {
    func languageScreening(selectedLanguage: String, selectedTime: String, isReload: Bool) {
        if !isReload {
            return
        }
        let currentVC = viewControllers[currentIndex]
        
        if let repositoriesVC = currentVC as? RepositoriesTrendingViewController{
             UserDefaults.LanguageScreeningRepositories.set(value: selectedTime, forKey: .since)
            UserDefaults.LanguageScreeningRepositories.set(value: selectedLanguage, forKey: .language)

            repositoriesVC.refreshData()
        } else if let develpoerVC = currentVC as? DevelpoerTrendingViewController {
            UserDefaults.LanguageScreeningDeveloper.set(value: selectedTime, forKey: .since)
            UserDefaults.LanguageScreeningDeveloper.set(value: selectedLanguage, forKey: .language)
            develpoerVC.refreshData()

        }
        
    }
}





