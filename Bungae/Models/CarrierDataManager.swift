//
//  CarrierDataManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class CarrierDataManager {
    private var carrierDataArray: [CarrierTypes] = []
    
    func makeCarrierData(){
        carrierDataArray = [
            CarrierTypes(carrierName: "SKT", carrierImage: UIImage(named: "circle")),
        CarrierTypes(carrierName: "KT", carrierImage: UIImage(named: "circle")),
        CarrierTypes(carrierName: "LG U+", carrierImage: UIImage(named: "circle")),
        CarrierTypes(carrierName: "SKT 알뜰폰", carrierImage: UIImage(named: "circle")),
        CarrierTypes(carrierName: "KT 알뜰폰", carrierImage: UIImage(named: "circle")),
        CarrierTypes(carrierName: "LG U+ 알뜰폰", carrierImage: UIImage(named: "circle")) ]
        
    }
    
    func getCarrierData() -> [CarrierTypes] {
        return carrierDataArray
    }
            
}
