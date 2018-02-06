//
//  LanguageScreeningViewController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/5.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit
import HandyJSON

enum LanguageScreeningType: Int {
    case repositories
    case developer
}

protocol LanguageScreeningProtocol: class {
    func languageScreening(selectedLanguage: String, selectedTime: String,isReload: Bool)
}


class LanguageScreeningViewController: UITableViewController {
  
    @IBOutlet weak var sinceSegmentedControl: UISegmentedControl!
    var selectedLanguage: String?
    var selectedTime: String?
    var isReload: Bool = false
    weak var deleagte: LanguageScreeningProtocol?
    lazy var languageArr: [LanguageList] = {
        guard let path = Bundle.main.path(forResource: "Languages.json", ofType: nil) else {
            return [LanguageList]()
        }
        let url = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url) else {
            return [LanguageList]()
        }
        let str = String(data:data, encoding: String.Encoding.utf8)
        guard let modellist = [LanguageList].deserialize(from: str),
            var modelArr = modellist as? [LanguageList] else {
            return [LanguageList]()
        }
        
       return modelArr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        handleData()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .groupTableViewBackground
        tableView.sectionIndexColor = .black
        tableView.rowHeight = 44.0
        tableView.register(R.nib.languageScreeningTableViewCell)
    }
    
    private func handleData() {
        switch since(rawValue: selectedTime!)!{
        case .daily:
            self.sinceSegmentedControl.selectedSegmentIndex = 0
        case .weekly:
            self.sinceSegmentedControl.selectedSegmentIndex = 1
        case .monthly:
            self.sinceSegmentedControl.selectedSegmentIndex = 2
        }
        
        var selectedModel: LanguageModel?
        for (firstindex, language) in languageArr.enumerated() {
            for (index, languageModel) in (language.languageList)!.enumerated() {
                if languageModel.languageName == selectedLanguage {
                    languageArr[firstindex].languageList![index].check = true
                    selectedModel = languageModel
                }
            }
        }
        
        
        let languageModel = LanguageModel(languageColor: selectedModel?.languageColor ?? "#cccccc", languageName: selectedModel?.languageName ?? "所有语言", check: true)
        let language = LanguageList(languageHead: "当前语言", languageList: [languageModel])
        languageArr .insert(language, at: 0)
        tableView.reloadData()
    }
}

// MARK: - Table view data source & deleagte
extension LanguageScreeningViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return languageArr.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let languange = languageArr[section]
        return (languange.languageList?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.languageScreeningTableViewCell, for: indexPath)!
        let languange = languageArr[indexPath.section]
        let languangeModel = languange.languageList?[indexPath.row]
//        cell.languageLable.text = languangeModel?.languageName
//        cell.languageColorView.backgroundColor = UIColor((languangeModel?.languageColor)!)
//        cell.checkImageView.isHidden = !((languangeModel?.check)!)
        cell.languageModel = languangeModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let languange = languageArr[section]
        return languange.languageHead
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        return ["#","1","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let languange = languageArr[indexPath.section]
        let languangeModel = languange.languageList?[indexPath.row]
        let value = segmentedControlSegmentIndex(self.sinceSegmentedControl.selectedSegmentIndex)

        if (languangeModel?.languageName != selectedLanguage)  || (value != selectedTime) {
            isReload = true
        }
        
        deleagte?.languageScreening(selectedLanguage: (languangeModel?.languageName)!, selectedTime: value, isReload: isReload)
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - targat-action
extension LanguageScreeningViewController {
    
    @IBAction func doneButtonClick(_ sender: Any) {
        let value = segmentedControlSegmentIndex(self.sinceSegmentedControl.selectedSegmentIndex)
        isReload = (value != selectedTime)
        deleagte?.languageScreening(selectedLanguage: selectedLanguage!, selectedTime: value, isReload: isReload)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func segmentedControlSegmentIndex(_ index: Int) -> String {
        switch index {
        case 0:
            return since.daily.rawValue
        case 1:
            return since.weekly.rawValue
        case 2:
            return since.monthly.rawValue
        default:
            return since.daily.rawValue
        }
    }
    
}
