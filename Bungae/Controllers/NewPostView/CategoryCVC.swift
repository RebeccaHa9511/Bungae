//
//  CategoryCVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import UIKit

class CategoryCVC: UITableViewCell {
//
//    var firstCategoryResult = DefaultData.categoryONE
//    var secondCategoryResult = DefaultData.categoryTWO
    @IBOutlet weak var categoryLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func setData(_ indexPath : IndexPath,_ data : [CategoryResult]){
        categoryLbl.text = data[indexPath.row].name
//        firstCategoryResult = data[indexPath.row]
    }
    
    func setData(_ indexPath : IndexPath,_ data : [SubCateResult]){
        categoryLbl.text = data[indexPath.row].name
//        secondCategoryResult = data[indexPath.row]
    }
    
    
}
