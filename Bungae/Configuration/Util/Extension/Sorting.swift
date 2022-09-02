//
//  Sorting.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/26.
//

import Foundation
import UIKit

protocol SortDelegate{
    
    func sendSorting(_ data : Sort)
}


enum Sort : String{
    case recent = "recent"
    
    case lowPrice = "lowPrice"

    case highPrice = "highPrice"
}


extension UIButton {
    
    var sorting : Sort {
        switch self.tag{
        case 0: return .recent
        case 1: return .lowPrice
        case 2: return .highPrice
        default: return .recent
        }
           
    }
}
