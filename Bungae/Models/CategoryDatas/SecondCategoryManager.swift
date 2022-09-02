//
//  SecondCategoryManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/30.
//

import UIKit

class SecondCategoryManager {
    private var secondCategoryArray: [SecondCategoryData] = []
    
    func makeCategoryArray(){
        secondCategoryArray = [ SecondCategoryData(name: "자켓"),SecondCategoryData(name: "조끼/베스트"),SecondCategoryData(name: "셔츠"),SecondCategoryData(name: "바지"),SecondCategoryData(name: "청바지"),SecondCategoryData(name: "패딩/점퍼"),SecondCategoryData(name: "블라우스"),SecondCategoryData(name: "반바지"),SecondCategoryData(name: "정장"),SecondCategoryData(name: "트레이닝"),SecondCategoryData(name: "티셔츠"),SecondCategoryData(name: "치마") ]
    }
    
    func getData() -> [SecondCategoryData] {
        return secondCategoryArray
    }
            
}
