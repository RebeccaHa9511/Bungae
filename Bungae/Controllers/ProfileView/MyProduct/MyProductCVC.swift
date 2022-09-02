//
//  MyProductCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/30.
//

import UIKit
import Kingfisher

class MyProductCVC: UICollectionViewCell {
    
    
    var userProductData : UsersProductData?
    
    @IBOutlet weak var myproductImg: UIImageView!
    
    @IBOutlet weak var myproductPrice: UILabel!
    
    @IBOutlet weak var myproductTitle: UILabel!
    
    @IBOutlet weak var myHeartButton: UIButton!
    
    
    // MARK: - nib awake
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myHeartButton.setBackgroundImage(UIImage(systemName: "선택하트"), for: .selected)
        myHeartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        
        configureUI()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myproductPrice.text = ""
        myproductTitle.text = ""
        
        myHeartButton.isHidden = false
        myHeartButton.isSelected = false
        

    }
    
    // MARK: - configure UI
    
    
    func configureUI() {
        
        myproductImg.layer.cornerRadius = 10
        myproductImg.clipsToBounds = true
        
        
    }
    
    // MARK: - Data setup
    
    func setupData(_ data: UsersProductData){
        userProductData = data
        
        myproductImg.kingfisher(urlString: data.image)
        
        
        myproductPrice.text = data.price + "원"
        myproductTitle.text = data.itemName
        
    }
    
    
    
}
