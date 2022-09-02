//
//  ChatDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class ChatDataManager {
    private var chatDataArray: [ChatData] = []
    
    func makeChatDataArray(){
        chatDataArray = [
            ChatData.init(chatName: "번개장터", chatImage: UIImage(named: "번개"), chatContent: "(이모티콘)안녕", chatTime: "오전 10:51"),
            ChatData.init(chatName: "번개장터2", chatImage: UIImage(named: "nilImage"), chatContent: "라이징테스트 화이팅", chatTime: "오전 10:13")
           ]
    }
    
    func getCarrierData() -> [ChatData] {
        return chatDataArray
    }
            
}
