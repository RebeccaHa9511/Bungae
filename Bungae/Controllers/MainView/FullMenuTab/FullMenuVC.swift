//
//  FullMenuVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class FullMenuVC: BaseViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - NAV BAR SETTING
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navBarAppear()
        tabBarAppear()
        
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    

    
}
