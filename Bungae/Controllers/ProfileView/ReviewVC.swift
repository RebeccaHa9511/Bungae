//
//  ReviewVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class ReviewVC: BaseViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }


}
