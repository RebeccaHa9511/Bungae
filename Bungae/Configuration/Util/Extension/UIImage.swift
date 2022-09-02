//
//  UIImage.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import Kingfisher
import UIKit

extension UIImageView{
    
    func kingfisher(urlString : String){
        let imageURL = URL(string: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: imageURL, placeholder: nil, options: [.transition(.fade(1.0))], progressBlock: nil)
    }


    
}
