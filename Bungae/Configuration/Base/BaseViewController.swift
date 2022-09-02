//
//  BaseViewController.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func navBarHidden(){
        navigationController?.isNavigationBarHidden = true
    }
    
    func navBarAppear(){
        navigationController?.isNavigationBarHidden = false
    }
    
    func tabBarHidden(){
        tabBarController?.tabBar.isHidden = true
    }
    
    func tabBarAppear(){
        tabBarController?.tabBar.isHidden = false
    }
    
    func buttonSelected(_ btn: UIButton){
        btn.setTitleColor(UIColor.ThisRed, for: .selected)
        btn.setTitleColor(UIColor.systemGray3, for: .normal)
        btn.isSelected = true
        btn.backgroundColor = UIColor.ThisPink
    }
    
    func buttonUnselected(_ btn: UIButton){
        btn.setTitleColor(UIColor.ThisRed, for: .selected)
        btn.setTitleColor(UIColor.systemGray3, for: .normal)
        btn.isSelected = false
        btn.backgroundColor = .white
    }
    
}
