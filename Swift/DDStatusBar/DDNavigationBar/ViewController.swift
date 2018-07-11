//
//  ViewController.swift
//  DDNavigationBar
//
//  Created by czw on 2017/9/2.
//  Copyright © 2017年 czw. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
    }

    @IBAction func pushButtonAction(_ sender: UIButton) {
    
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

