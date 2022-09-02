//
//  cartTVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/09/01.
//

import UIKit

class cartTVC: UITableViewCell {

    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartTitleLbl: UILabel!
    
    var cartTitleTxt : String = ""
    var cartPriceTxt : String = ""
    var cartImageImg : [String] = []
    
    //Property
    var productDataResult : ProductDataResult?
    
    // MARK: - view did load
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupData(productDataResult!)
        configureUI()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - UI
    
    func configureUI(){
        cartImage.clipsToBounds = true
        cartImage.layer.cornerRadius = 5
        
        
    }
    
    // MARK: - data
    func setupData(_ data: ProductDataResult){
        self.productDataResult = data
        cartPrice.text = data.price + "원"
        cartTitleLbl.text = data.name
        
        cartImage.kingfisher(urlString: data.images[0])

    }
    
    func getData() {
        cartTitleLbl.text = cartTitleTxt
        cartPrice.text = cartPriceTxt
        cartImage.kingfisher(urlString: cartImageImg[0])
        
    }
    
    
    
}
