//
//  FullMenuCategory.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

protocol SecondCategoryDelegate{
    
    func sendSecondCategory(_ data : SubCategoryResponse)
    
}

protocol FirstCategoryDelegate{
    
    func sendFirstCategory(_ data : CategoryResponse)
    
}

class FullMenuCategory: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    
// MARK: - button action
    
    @IBAction func menButtonTapped(_ sender: UIButton) {
        let detailVC = UIStoryboard(name: "CategoryView", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailVC") as! CategoryDetailVC
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
   

}
