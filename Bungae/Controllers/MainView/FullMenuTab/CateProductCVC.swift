//
//  CateProductCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/09/01.
//

import UIKit

class CateProductCVC: UICollectionViewCell {

    
    @IBOutlet weak var cateProductImg: UIImageView!
    @IBOutlet weak var catePriceLbl: UILabel!
    @IBOutlet weak var cateTitleLbl: UILabel!
    @IBOutlet weak var cateHeartButton: UIButton!
    
    var heartSelected : Bool = false
    
    var cateDataResult : CategoryItem?
    
    
    // MARK: - view did load
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureUI()
        
    }

    
    // MARK: - data
    
    func setData(_ data : CategoryItem){
        self.cateDataResult = data

        
        cateTitleLbl.text = data.name
        catePriceLbl.text = data.price + "원"
        
        cateProductImg.kingfisher(urlString: data.image)

        cateHeartButton.setBackgroundImage(UIImage(systemName: "선택하트"), for: .selected)
        cateHeartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        
            
        }
    
    // MARK: - UI
    
    func configureUI(){
        cateProductImg.layer.cornerRadius = 10
        cateProductImg.clipsToBounds = true
        
    }
    
}
