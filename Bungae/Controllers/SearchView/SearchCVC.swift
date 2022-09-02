//
//  SearchCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/26.
//

import UIKit

class SearchCVC: UICollectionViewCell {

    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var searchImageView: UIImageView!
    
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchPriceLabel: UILabel!
    
    var heartSelected : Bool = false
    
    var searchDataResult : SearchResponse?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    func configUI(){
        searchImageView.layer.cornerRadius = 10
        searchImageView.clipsToBounds = true
        
    }
    
    func setData(_ data : SearchResponse){
        self.searchDataResult = data

        
        searchTitleLabel.text = data.name
        searchPriceLabel.text = data.price + "원"
        
        searchImageView.kingfisher(urlString: data.image)

        heartButton.setBackgroundImage(UIImage(systemName: "선택하트"), for: .selected)
        heartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            
        }

}
