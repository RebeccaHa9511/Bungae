//
//  StatusPopupVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class StatusPopupVC: BaseViewController {

    
    @IBOutlet weak var changeStatusView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }


    func configureUI() {
        changeStatusView.layer.cornerRadius = 10
        changeStatusView.clipsToBounds = true
        
    }
    
    
    
    // MARK: - Button action
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let editVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "StatusChangeVC") as! StatusChangeVC
        
        navigationController?.pushViewController(editVC, animated: true)
        
    }
    
    
    @IBAction func detailViewButtonTapped(_ sender: UIButton) {
        let detailVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "DetailStoreVC") as! DetailStoreVC
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
}


