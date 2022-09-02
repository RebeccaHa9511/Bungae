//
//  FollowerTVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class FollowerTVC: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var productCountlbl: UILabel!
    @IBOutlet weak var followerLbl: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

    
    
}
