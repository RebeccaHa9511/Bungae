//
//  StatusChangeVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class StatusChangeVC: BaseViewController {

    @IBOutlet weak var storenameTextField: UITextField!
    @IBOutlet weak var storeAddressTextField: UITextField!
    @IBOutlet weak var contactHourTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storenameTextField.delegate = self
        storeAddressTextField.delegate = self
        contactHourTextField.delegate = self

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }

    
    
    // MARK: - button action

    @IBAction func myStoreInfoButtonTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func exchangePolicyTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    
    @IBAction func cautionTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        
    }
    
    //Change Image -> to pickerView
    @IBAction func changeImageButtonTapped(_ sender: UIButton) {
        
        
    }
    
}

extension StatusChangeVC : UITextFieldDelegate {
    
    
}
