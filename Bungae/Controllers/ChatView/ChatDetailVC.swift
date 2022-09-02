//
//  ChatDetailVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class ChatDetailVC: UIViewController {
    
    var chatData: ChatData?
    
    
    @IBOutlet weak var chatTimeLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()

    }
    
    func setupTable() {
        chatTimeLbl.text = chatData?.chatTime

    }


}
