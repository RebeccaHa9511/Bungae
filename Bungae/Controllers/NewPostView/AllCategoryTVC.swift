//
//  AllCategoryTVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import UIKit

class AllCategoryTVC: UITableViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    
//
//    var firstCategoryResult = DefaultData.categoryONE
//    var secondCategoryResult = DefaultData.categoryTWO
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

    
    func setData(_ indexPath : IndexPath,_ data : [CategoryResult]){
        categoryLbl.text = data[indexPath.row].name
//        secondCategoryResult = data[indexPath.row]
    }
    
}
