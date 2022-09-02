//
//  FollowingVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class FollowingVC: BaseViewController {

    @IBOutlet weak var followingCV: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DELEGATE
        
    }
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
    // MARK: - BUTTON ACTION
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    

 
}

// MARK: - DELEGATES

