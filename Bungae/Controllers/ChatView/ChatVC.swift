//
//  ChatVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    var chatArray: [ChatData] = []
    var chatDataManager = ChatDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatDataManager.makeChatDataArray()
        chatArray = chatDataManager.getCarrierData()
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        chatTableView.rowHeight = 85
    }
    

  

}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTVC", for: indexPath) as! ChatTVC
        
        cell.chatName.text = chatArray[indexPath.row].chatName
        cell.chatContent.text = chatArray[indexPath.row].chatContent
        cell.chatTime.text = chatArray[indexPath.row].chatTime
        cell.chatProfile.image = chatArray[indexPath.row].chatImage
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // prepare세그웨이(데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! ChatDetailVC
            let index = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.chatData = chatArray[index.row]
        }
    }
    
}
