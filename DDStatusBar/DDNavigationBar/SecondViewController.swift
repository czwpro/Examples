//
//  SecondViewController.swift
//  DDNavigationBar
//
//  Created by czw on 2017/9/3.
//  Copyright © 2017年 czw. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    var statusBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.brown
        
        let button = UIButton(frame: CGRect(x: 150, y: 150, width: 60, height: 45))
        button.addTarget(self, action: #selector(FirstViewController.buttonAction), for: .touchUpInside)
        button.setTitle("button", for: .normal)
        view.addSubview(button)
    }

    func buttonAction() {
      
        statusBarHidden = !statusBarHidden
        // show menu & hide status bar
        if statusBarHidden {
            let keyWindow = UIApplication.shared.keyWindow
            keyWindow?.windowLevel = UIWindowLevelStatusBar + 1
        } else {
            UIApplication.shared.keyWindow?.windowLevel = UIWindowLevelNormal
        }
        
    }

}
