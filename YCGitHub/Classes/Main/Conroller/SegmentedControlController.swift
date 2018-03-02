//
//  SegmentedControlController.swift
//  YCGitHub
//
//  Created by YoukaStation on 2018/2/28.
//  Copyright © 2018年 YoukaStation. All rights reserved.
//

import UIKit


@objc protocol SegmentedControlControllerDelegate: class {
    @objc optional func segmentedControlController(segmentedControlController: UIViewController, didSelectViewController: UIViewController)
}

class SegmentedControlController: UIViewController {
    weak var delegate: SegmentedControlControllerDelegate?
    var viewControllers: [UIViewController]? {
        didSet {
            initialize()
        }
    }
    var segmentedControl: UISegmentedControl?
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func initialize() {
        let currentViewController = (viewControllers?.first)!
        addChildViewController(currentViewController)
        
        currentViewController.view.frame = self.view.bounds
        self.view.addSubview(currentViewController.view)
        currentViewController.didMove(toParentViewController: self)
        self.currentViewController = currentViewController
        segmentedControl =  UISegmentedControl(items: self.viewControllers!.map({$0.title ?? "NO Title"}))
        segmentedControl?.selectedSegmentIndex = 0
        segmentedControl?.addTarget(self, action: #selector(segmentedControlSelected), for: .valueChanged)
        navigationItem.titleView = segmentedControl
    }
    
    @objc func segmentedControlSelected() {
        
        let toViewController = self.viewControllers![segmentedControl!.selectedSegmentIndex]
        cycle(fromViewController: self.currentViewController!, toViewController: toViewController)
    }
    
    private func cycle(fromViewController: UIViewController, toViewController: UIViewController) {
        fromViewController.willMove(toParentViewController: nil)
        addChildViewController(toViewController)
        toViewController.view.frame = self.view.bounds
        transition(from: fromViewController, to: toViewController, duration: 0, options: [], animations: nil) { (finished) in
              self.currentViewController = toViewController
            self.delegate?.segmentedControlController!(segmentedControlController: self, didSelectViewController: toViewController)
        }
        
    }

}

