//
//  LoginNameVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class LoginNameVC: BaseViewController {

    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        dismissKeyboardWhenTappedAround()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       navBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        

        navBarAppear()
        
    }

    // MARK: - BUTTON ACTION
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let text = nameTextField.text else {return }
        underline.backgroundColor = .systemGray5
        userName = !text.isEmpty ? text : nil
        
        if userName != nil {
            let birthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginBirthVC") as! LoginBirthVC
            
            self.navigationController?.pushViewController(birthVC, animated: true)
            // 토큰 받아오기
            
        } else {
            presentBottomAlert(message: "이름을 입렵해주세요.")
        }
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}

// MARK: - Delegates EXTENSION

extension LoginNameVC : UITextFieldDelegate{
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
            underline.backgroundColor = .black
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            underline.backgroundColor = .systemGray4
            dismissKeyboard()
            
            guard let text = textField.text else {return }
            userName = !text.isEmpty ? text : nil
            
        }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.endEditing(true)
            return true
        }


}
