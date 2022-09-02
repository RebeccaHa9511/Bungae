//
//  NewPostVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class NewPostVC: BaseViewController {

    @IBOutlet weak var ftfAllowedLbl: UILabel!
    
    @IBOutlet weak var exchangelbl: UILabel!
    @IBOutlet weak var isUsedLabel: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    
    
    //DATA SETUP
    var optionData = OptionData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHidden()
        tabBarHidden()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
        
    }
    
    // MARK: - UI
    
    func configureUI() {
        
        
    }
    
    private func setOptionData(){
        countLbl.text = "\(optionData.amount)개"
        isUsedLabel.text = optionData.used ? "중고상품" : "새상품"
        exchangelbl.text = optionData.exchangeable ? "교환가능" : "교환불가"
        
    }
    
    // MARK: - BUTTON ACTIONS

    @IBAction func backButtonTapped(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        
        guard let TabbarVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        
        TabbarVC.modalPresentationStyle = .fullScreen
            present(TabbarVC, animated: false)
            
        }
        
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        print("camera Tapped!!!!!:!:!")
        
    }
    
    @IBAction func categoryButtonTapped(_ sender: UITapGestureRecognizer) {
        let categoryVC = UIStoryboard(name: "NewPost", bundle: nil).instantiateViewController(withIdentifier: "PostCategoryVC") as! PostCategoryVC
        

        navigationController?.pushViewController(categoryVC, animated: true)
        
    }
    

    @IBAction func tagButtonTapped(_ sender: UITapGestureRecognizer) {
      
            let tagVC = UIStoryboard(name: "NewPost", bundle: nil).instantiateViewController(withIdentifier: "PostTagVC") as! PostTagVC

            navigationController?.pushViewController(tagVC, animated: true)
            
        
    }
    
    
    @IBAction func shippingIncluded(_ sender: UIButton) {

        sender.tintColor = .systemRed
        
        
    }
    
    
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        let optionVC = UIStoryboard(name: "NewPost", bundle: nil).instantiateViewController(withIdentifier: "OptionVC") as! OptionVC
        
        navigationController?.pushViewController(optionVC, animated: true)
        
    }
    
    
}
