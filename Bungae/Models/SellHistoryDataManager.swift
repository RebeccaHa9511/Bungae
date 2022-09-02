//
//  SellHistoryDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/29.
//

import UIKit

class SellHistoryDataManager {
    private var sellDataArray: [SellHistoryData] = []
    
    func makesellArray(){
        sellDataArray = [SellHistoryData(tableLabel: "판매내역", tableImg: UIImage(named: "판매내역역")),SellHistoryData(tableLabel: "택배발송", tableImg: UIImage(named: "택배발송송송"))]
    }
    
    func getData() -> [SellHistoryData] {
        return sellDataArray
    }
            
}
