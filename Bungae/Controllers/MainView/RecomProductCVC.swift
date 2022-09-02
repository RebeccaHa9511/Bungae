//
//  RecomProductCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit
import Kingfisher
import ImageSlideshow


class RecomProductCVC: UICollectionViewCell {
    
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var updatedTimeLbl: UILabel!
    @IBOutlet weak var likesCountLbl: UILabel!
    
    var likesCount : Int = 0
    var heartSelected : Bool = false
    
    var productDataResult : ProductDataResult?


    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //HEART
        heartButton.tintColor = .white
        heartButton.isSelected = heartSelected
        heartButton.isHidden = false
        
        //LABELS
        titleLbl.text = ""
        priceLbl.text = ""
        likesCountLbl.text = String(likesCount)
        updatedTimeLbl.text = ""
        locationLbl.text = ""
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - SETUP UI
    
    func configureUI(){
        
        productImgView.layer.cornerRadius = 10
        productImgView.clipsToBounds = true
    }

    
    
    // MARK: - BUTTON ACTION
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        
        if heartButton.isSelected {
            heartButton.tintColor = UIColor.ThisRed
        } else {
            heartButton.tintColor = .white
        }
        
        //하트 누르면 찜목록으로 네트워킹 슝 해서 이동할 수 있도록!!! 🙏🙏
    }
    
    
    // MARK: - SETUP DATA
    
    
    
    func setData(_ data : ProductDataResult){
        self.productDataResult = data

        
        titleLbl.text = data.name
        priceLbl.text = data.price + "원"
        locationLbl.text = data.location
        updatedTimeLbl.text = data.time
        likesCountLbl.text = data.wish
        
        //Image Caching
        productImgView.kingfisher(urlString: data.images[0])

        heartButton.setBackgroundImage(UIImage(systemName: "선택하트"), for: .selected)
        heartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        
       

            
        }
        
        

    
}


