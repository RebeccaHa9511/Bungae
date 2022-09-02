//
//  SignUpVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import UIKit

class SignUpVC: BaseViewController {
    
    @IBOutlet weak var useridTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var underline: UIView!

    @IBOutlet weak var underline2: UIView!
    //Property
    
    var userName : String?
    var password : String?
    
    
    
    // MARK: -  view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyboardWhenTappedAround()
        
        useridTF.delegate = self
        passwordTF.delegate = self
        
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
    
    
    // MARK: - button action
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let text = useridTF.text else {return }
        
        userName = !text.isEmpty ? text : nil
        
        postData()
        
        if userName != nil {
            let birthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPhoneNumVC") as! LoginPhoneNumVC
            
            self.navigationController?.pushViewController(birthVC, animated: true)
            // 토큰 받아오기
            
        } else {
            presentBottomAlert(message: "이름을 입렵해주세요.")
        }
    }
       // MARK: - config UI
    
    func configureUI(){
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
    }
    
    // MARK: - post DATA!!
    
    func postData(){
        SignUpDataManager.shared.postRegister(loginId: userName!, password: password ?? "Tkdpf4028!") { (response) in
            switch response {

            case .success(let data) :
                let responseData = data as! SignUpResponse
                
            case .requestErr:
                print("REQUEST ERR 입니다 ")
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

extension SignUpVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dismissKeyboardWhenTappedAround()
        underline.backgroundColor = .black
        underline2.backgroundColor = .black
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dismissKeyboard()
        
        guard let text = useridTF.text else {return }
        guard let textPass = passwordTF.text else {return }

        
        underline.backgroundColor = .systemGray4
        underline2.backgroundColor = .systemGray4
        
      
        userName = !text.isEmpty ? text : nil
        
        password = !textPass.isEmpty ? textPass : nil

        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    
}
