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
        settings.style.titleColor = navBarTitleColor
        settings.style.selectedDotColor = themeColor;
        settings.style.dotColor = .lightGray;
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
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
            
            selectedLanguage = LanguageScreeningDataTool.getLanguage(.repositories)
            selectedTime = LanguageScreeningDataTool.getTime(.repositories)
        case 1:
            selectedLanguage = LanguageScreeningDataTool.getLanguage(.developer)
            selectedTime = LanguageScreeningDataTool.getTime(.developer)
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
            LanguageScreeningDataTool.saveTime(selectedTime, screeningType: .repositories)
            LanguageScreeningDataTool.saveLanguage(selectedLanguage, screeningType: .repositories)

            repositoriesVC.refreshData()
        } else if let develpoerVC = currentVC as? DevelpoerTrendingViewController {
            LanguageScreeningDataTool.saveTime(selectedTime, screeningType: .developer)
            LanguageScreeningDataTool.saveLanguage(selectedLanguage, screeningType: .developer)
            develpoerVC.refreshData()

        }
        
    }
}





