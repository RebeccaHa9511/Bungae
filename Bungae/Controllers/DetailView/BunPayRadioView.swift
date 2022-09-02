//
//  BunPayRadioView.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import UIKit
import DLRadioButton

class BunPayRadioView: BaseViewController {

    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var shipButton: DLRadioButton!
    @IBOutlet weak var mtmButton: DLRadioButton!
    
    var switchON : Bool = false
    var button : Bool = false
    let defaults = UserDefaults.standard
    
    var detailIDX : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarHidden()
        shipButton?.isEnabled = UserDefaults.standard.bool(forKey: "switchState")
        shipButton?.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarAppear()
    }
    
    // MARK: - configrue UI
    
    func configureUI() {
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10
    }
    
    // MARK: - Button setup
    
    func setupButton(){
        shipButton.isSelected = UserDefaults.standard.bool(forKey: "isSaved")
        mtmButton.isSelected = UserDefaults.standard.bool(forKey: "isSaved")
        
    }
    
    @IBAction func buttonAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            print("택배거래 선택됨⭐️")
            sender.isEnabled = true
            switchON = true
            defaults.set(switchON, forKey: "switchON")
        }
        else if sender.tag == 2 {
            print("직거래 선택됨⭐️")
            sender.isEnabled = true
            switchON = false
            defaults.set(switchON, forKey: "switchON")
        }
        
        UserDefaults.standard.set(sender.isEnabled, forKey: "switchState")
        UserDefaults.standard.synchronize()
        
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let nextVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "mtmVC") as! mtmVC
        
        nextVC.detailIDX = self.detailIDX
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
