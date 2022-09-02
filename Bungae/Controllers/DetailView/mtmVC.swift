//
//  mtmVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import UIKit
import DLRadioButton

class mtmVC: BaseViewController {
    
    
    @IBOutlet weak var cartNAME: UILabel!
    @IBOutlet weak var cartPRICE: UILabel!
    @IBOutlet weak var cartIMG: UIImageView!
    
    @IBOutlet weak var PayPriceTwo: UILabel!
    @IBOutlet weak var PayPriceLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    
    @IBOutlet weak var pointTextField: UITextField!
    @IBOutlet weak var myPointLbl: UILabel!
    @IBOutlet weak var useAllButton: UIButton!
    
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var payPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var simplePayButton: DLRadioButton!
    @IBOutlet weak var otherPayButton: DLRadioButton!

    @IBOutlet weak var payButton: UIButton!
    
    //Property
    var productDataResult : ProductDataResult?
    var productData : [ProductDataResult] = []
    var detailIDX : String = ""
 
    
    
    
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        getProducts()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
        getProducts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }
    
    
    // MARK: - UI
    
    func configureUI(){
        payButton.layer.cornerRadius = 10
        payButton.clipsToBounds = true
        
        
    }
    
    // MARK: - data
    
    func getProducts(){
       ProductDataManager.shared.getProduct(idx: detailIDX) { (response) in
           switch response {

           case .success(let data) :

               let responseData = data as! ProductDataResponse

               if responseData.isSuccess {
                   self.setupCartData(responseData.result)
                   print("Response 성공했습니다🌷")
               } else {
                   self.presentBottomAlert(message: "Bottom 입니다🌷")
               }



           case .requestErr(let msg):
               print(msg)
           case .pathErr :
               print("pathErr")
           case .serverErr :
               print("serverErr")
           case .networkFail:
               print("networkFail")
           case .decodeErr:
               print("decodeError🌷🌷")
           }
       }

   }
    
    func setupCartData(_ data : ProductDataResult){
        cartNAME.text = data.name
        
        cartPRICE.text = data.price
        payPrice.text = data.price
        totalPrice.text = data.price
        PayPriceTwo.text = data.price
        
        cartIMG.kingfisher(urlString: data.images[0])
        
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func cancleButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    


}

