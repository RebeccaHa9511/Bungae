//
//  PostTagVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class PostTagVC: BaseViewController {

    @IBOutlet weak var tagTextField: UITextField!
    
 
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    
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
    
    // MARK: - Button actioin
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
}

