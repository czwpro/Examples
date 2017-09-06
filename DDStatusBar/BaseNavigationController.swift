//
//  BaseNavigationController.swift
//  DDNavigationBar
//
//  Created by czw on 2017/9/2.
//  Copyright © 2017年 czw. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
    }

    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

}
