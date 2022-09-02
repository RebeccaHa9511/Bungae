//
//  LoginPhoneNumVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class LoginPhoneNumVC: BaseViewController {

    var phoneNum : String?
    var certNum : String?
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var phoneUnderLine: UIView!
    
    
    // MARK: -  view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumTextField.delegate = self

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
        
    }
    
    
    
    // MARK: - BUTTON ACTION
    
    
    @IBAction func backbuttonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

    
    // MARK: - POST DATA
    
    func postData(){
        PhoneNumCertManager.shared.postPhonenumber(phoneNumber: phoneNum!) { (response) in
            switch response {

            case .success(let data) :
                let responseData = data as! PhoneNumCertResponse
                
            case .requestErr(let msg):
                self.presentBottomAlert(message: msg as! String)
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }
    }
    
    
    


}

// MARK: - Delegates EXTENSION

extension LoginPhoneNumVC : UITextFieldDelegate{
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            phoneUnderLine.backgroundColor = .black
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            phoneUnderLine.backgroundColor = .systemGray4
            dismissKeyboard()
            
            guard let text = textField.text else {return }
            phoneNum = !text.isEmpty ? text : nil
            
            
            postData()
            let authVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhoneAuthVC") as! PhoneAuthVC
            
            self.navigationController?.pushViewController(authVC, animated: true)
            
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return true
        }


}
