//
//  OtherLoginVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class OtherLoginVC: BaseViewController {

    
    @IBOutlet weak var backgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       navBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        

        navBarAppear()
        
    }
    

    // MARK: - UI
    
    func configureUI() {
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
    }
    
    
    // MARK: - BUTTON ACTION
    
    
    @IBAction func startAuthButtonTapped(_ sender: UIButton) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        self.navigationController?.pushViewController(mainVC, animated: true)
        
        
    }
    

}
