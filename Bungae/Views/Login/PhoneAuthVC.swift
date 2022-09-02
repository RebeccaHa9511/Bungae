//
//  PhoneAuthVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class PhoneAuthVC: BaseViewController {

    
    @IBOutlet weak var errorMessageLbl: UILabel!
    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var authNumTextField: UITextField!
    @IBOutlet weak var coutdownLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var limitTime : Int = 180 //3min
    
    var authNum : String?
    var certNum : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissKeyboardWhenTappedAround()
        authNumTextField.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHidden()
        tabBarHidden()
        
        getSetTime()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navBarAppear()
        tabBarAppear()
        
    }
    
    // MARK: - Button Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
            getAuthData()
    }
    
    @objc func getSetTime() {
        
        secToTime(sec: limitTime)
        limitTime -= 1
    }
    
    func secToTime(sec: Int) {
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 60
        
        if second < 10 {
            timerLabel.text = String(minute) + ":" + "0" + String(second)
        } else { timerLabel.text = String(minute) + ":" + String(second)
        }
        if limitTime != 0 {
            perform(#selector(getSetTime), with: nil, afterDelay: 1.0)
        }
        
        else if limitTime == 0 {
            timerLabel.isHidden = true
        }
    }
    
    // MARK: - get data
    
    func getAuthData(){
        TextAuthManager.shared.getAuth(authNumber: authNum!) { (response) in
  
            
            switch response {

            case .success(let data) :
                let responseData = data as! TextAuthResponse
                
                let mainVC = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                self.changeRootViewController(mainVC)
                
            case .requestErr(let msg):
                self.presentBottomAlert(message: msg as! String)
                self.errorMessageLbl.text = "인증번호가 일치하지 않습니다."
                self.errorMessageLbl.textColor = .systemRed
                self.errorMessageLbl.font = .systemFont(ofSize: 13, weight: .bold)
                self.underline.backgroundColor = .systemRed
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

// MARK: - Extension

extension PhoneAuthVC :UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        underline.backgroundColor = .black
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        dismissKeyboard()
        
        guard let text = textField.text else {return }
        underline.backgroundColor = .systemGray4
        authNum = !text.isEmpty ? text : nil
        
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
}
