//
//  UserProductCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import UIKit

class UserProductCVC: UICollectionViewCell {
    
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var userItemImage: UIImageView!
    @IBOutlet weak var userItemPriceLbl: UILabel!
    @IBOutlet weak var uerItemtitleLbl: UILabel!
    
    var userProductData : UsersProductData?
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        heartButton.setBackgroundImage(UIImage(systemName: "선택하트"), for: .selected)
       heartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        
        configureUI()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userItemPriceLbl.text = ""
        uerItemtitleLbl.text = ""
        
        heartButton.isHidden = false
        heartButton.isSelected = false
        

    }
    
    // MARK: - UI
    
    func configureUI() {
        userItemImage.clipsToBounds = true
        userItemImage.layer.cornerRadius = 10
    }
    
    
    func setupData(_ data: UsersProductData){
        userProductData = data
        
        userItemImage.kingfisher(urlString: data.image)
        
        
        userItemPriceLbl.text = data.price + "원"
        uerItemtitleLbl.text = data.itemName
        
    }
    
    
}
