
//
//  FirstViewController.swift
//  DDNavigationBar
//
//  Created by czw on 2017/9/2.
//  Copyright © 2017年 czw. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

    var statusBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.orange
        
        let button = UIButton(frame: CGRect(x: 150, y: 150, width: 60, height: 45))
        button.addTarget(self, action: #selector(FirstViewController.buttonAction), for: .touchUpInside)
        button.setTitle("button", for: .normal)
        view.addSubview(button)
        
        navigationController?.navigationBar.fixedHeightWhenStatusBarHidden = true
    }
    
    func buttonAction() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        statusBarHidden = true
        
         UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }
    
}


