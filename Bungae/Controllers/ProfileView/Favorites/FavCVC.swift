//
//  FavCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/31.
//

import UIKit

class FavCVC: UICollectionViewCell {

    var wishlistData : WishResult?
    
    var productDataResult : ProductDataResult?
    var productData : [ProductDataResult] = []
    
    @IBOutlet weak var postedTime: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var favImg: UIImageView!
    
    @IBOutlet weak var favTitleLbl: UILabel!
    @IBOutlet weak var favPrice: UILabel!
    
    @IBOutlet weak var favHeartButton: UIButton!
    
    var detailidx : String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        configureUI()
    }
    
    // MARK: - UI
    func configureUI() {
        
        favImg.layer.cornerRadius = 20
        favImg.clipsToBounds = true
        
        profileImg.clipsToBounds = true
        profileImg.layer.cornerRadius = 10
        favHeartButton.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
        favHeartButton.tintColor = .ThisRed
        
    favHeartButton.setBackgroundImage(UIImage(named: "heart"), for: .selected)
      
        
        
    }
    
    // MARK: - button action
    
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        
        favHeartButton.isSelected = !favHeartButton.isSelected
        if favHeartButton.isSelected{
            favHeartButton.tintColor = .clear
            deleteHeart()
           
            
        } else{
            favHeartButton.tintColor = .ThisRed

        }

           
      
        
    }
    
    
    // MARK: - data setup
    
    func setupData(_ data: WishResult){
        wishlistData = data
        
        favImg.kingfisher(urlString: data.image)
        favPrice.text = data.price + "원"
        favTitleLbl.text = data.name
        
        sellerName.text = data.storeName
        profileImg.kingfisher(urlString: data.storeImg)
        postedTime.text = data.updatedAt
        
    }
    
    func deleteHeart(){
        RemoveWishManager.shared.removefromWishList(itemIdx: detailidx)  { (response) in
            switch response {

            case .success(let data) :
                let responseData = data as! AddtoWishResponse
//                self.getAllRecomProducts()
            case .requestErr(let msg):
                print ( "Request ERR 입니다🌷")
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
    
    func getAllRecomProducts(){
       ProductDataManager.shared.getProduct(idx: detailidx) { (response) in
           switch response {

           case .success(let data) :

               let responseData = data as! ProductDataResponse

               if responseData.isSuccess {
                   print("Response 성공했습니다🌷")
               } else {
                   print ( "Bottom 입니다🌷")
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
               print("decodeError")
           }
       }

   }
    

}
