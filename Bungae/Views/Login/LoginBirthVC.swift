//
//  LoginBirthVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class LoginBirthVC: UIViewController {

    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var underlineView: UIView!
    
    var birthday : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayTextField.delegate = self

    }
    
// MARK: - BUTTON ACTIONS
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    // ⭐️⭐️ 주민번호 뒷자리 앞에 한자리 입력하면 -> 바로 휴대폰 번호입력 하는 뷰 뜸
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let phoneVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPhoneNumVC") as! LoginPhoneNumVC
        
        self.navigationController?.pushViewController(phoneVC, animated: true)
        
    }
    
}

// MARK: - Delegates EXTENSION

extension LoginBirthVC : UITextFieldDelegate{
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            underlineView.backgroundColor = .black
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            underlineView.backgroundColor = .systemGray4
            dismissKeyboard()
            
            guard let text = textField.text else {return }
            birthday = !text.isEmpty ? text : nil
            
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return true
        }


}
