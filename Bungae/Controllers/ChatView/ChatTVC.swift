//
//  ChatTVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class ChatTVC: UITableViewCell {

    @IBOutlet weak var chatProfile: UIImageView!
    @IBOutlet weak var chatName: UILabel!
    @IBOutlet weak var chatContent: UILabel!
    @IBOutlet weak var chatTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
