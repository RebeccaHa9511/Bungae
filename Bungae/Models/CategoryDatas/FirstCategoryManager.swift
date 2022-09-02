//
//  FirstCategoryManager.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/30.
//

import UIKit

class FirstCategoryManager {
    private var firstCategoryArray: [FirstCategoryData] = []
    
    func makeCateArray(){
        firstCategoryArray = [FirstCategoryData(name: "여성의류"),FirstCategoryData(name: "남성의류"),FirstCategoryData(name: "신발"),FirstCategoryData(name: "가방"),FirstCategoryData(name: "시계/쥬얼리"),FirstCategoryData(name: "패션 액세서리"),FirstCategoryData(name: "디지털/가전"),FirstCategoryData(name: "스포츠/레저"),FirstCategoryData(name: "차량/오토바이"),FirstCategoryData(name: "스타굿즈"),FirstCategoryData(name: "키덜트"),FirstCategoryData(name: "예술/희귀/수집품"),FirstCategoryData(name: "음반/악기"),FirstCategoryData(name: "도서/티켓/문구"),FirstCategoryData(name: "뷰티/미용"),FirstCategoryData(name: "가구/인테리어"),FirstCategoryData(name: "생활/가공식품"),FirstCategoryData(name: "유아동/출산"),FirstCategoryData(name: "반려동물용품"),FirstCategoryData(name: "기타"),FirstCategoryData(name: "지역서비스"),FirstCategoryData(name: "원룸/함께살아요"),FirstCategoryData(name: "번개나눔"),FirstCategoryData(name: "구인구직"),FirstCategoryData(name: "재능"),FirstCategoryData(name: "커뮤니티")]
    }
    
    func getData() -> [FirstCategoryData] {
        return firstCategoryArray
    }
            
}


