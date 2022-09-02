//
//  OptionVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit
import Alamofire

//Protocol
protocol optionDelegate{
    
    func saveData(_ data : OptionData)
}

class OptionVC: BaseViewController {

    @IBOutlet weak var amountTF: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var optionView: UIView!
    
    
    @IBOutlet weak var usedButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    
    @IBOutlet weak var noExchangeBtn: UIButton!
    @IBOutlet weak var canExchangeBtn: UIButton!
    
    @IBOutlet var productStatebuttons: [UIButton]!
    @IBOutlet var exchangeButtons: [UIButton]!
    

    
    var optionData = OptionData()
    var delegate : optionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        optionDataSetup()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarAppear()
//        navBarAppear()
    }
    

    // MARK: - UI
    
    func configureUI() {
        optionView.clipsToBounds = true
        optionView.layer.cornerRadius = 10
        
        noExchangeBtn.clipsToBounds = true
        noExchangeBtn.layer.cornerRadius = 10
        noExchangeBtn.setTitleColor(UIColor.systemRed, for: .selected)
        noExchangeBtn.setTitleColor(UIColor.systemGray3, for: .normal)
        
        canExchangeBtn.clipsToBounds = true
        canExchangeBtn.layer.cornerRadius = 10
        canExchangeBtn.setTitleColor(UIColor.systemRed, for: .selected)
        canExchangeBtn.setTitleColor(UIColor.systemGray3, for: .normal)
        
        usedButton.clipsToBounds = true
        usedButton.layer.cornerRadius = 10
        usedButton.setTitleColor(UIColor.systemRed, for: .selected)
        usedButton.setTitleColor(UIColor.systemGray3, for: .normal)
        
        newButton.clipsToBounds = true
        newButton.layer.cornerRadius = 10
        newButton.setTitleColor(UIColor.systemRed, for: .selected)
        newButton.setTitleColor(UIColor.systemGray3, for: .normal)
        
        okButton.clipsToBounds = true
        okButton.layer.cornerRadius = 10
        
    }
    
    // MARK: - DATA
    
    private func optionDataSetup(){
        
        amountTF.text = String(optionData.amount)
        if ( optionData.used == false ){
            print("new!")
            buttonUnselected(usedButton)
            buttonSelected(newButton)
            
        }
        if ( optionData.exchangeable == true){
            buttonUnselected(noExchangeBtn)
            buttonSelected(canExchangeBtn)
        }
        
    }
    
    // MARK: - BUTTON ACTION
    
    @IBAction func productStateTapped(_ sender: UIButton) {
        
        for buttttton in productStatebuttons {
                   if buttttton == sender {
                       buttonSelected(buttttton)
                       
                       optionData.used = (buttttton.tag == 0) ? true : false
                       
                   } else {
                      buttonUnselected(buttttton)
                   }
        }
    }
    
    @IBAction func exchangeButtonTapped(_ sender: UIButton) {
        
        for btn in exchangeButtons {
                   if btn == sender {
                    buttonSelected(btn)
                       
                       optionData.exchangeable = (btn.tag == 0) ? false : true
                       
                       
                   } else {
                       buttonUnselected(btn)

                   }
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        var count = 1
        let text = amountTF.text!
        if (!text.isEmpty && text != "0") { count = Int(text)! }
        
        optionData.amount = count
        self.dismissKeyboard()
        dismiss(animated: true)
        
       delegate?.saveData(optionData)
        
    }
    
}
