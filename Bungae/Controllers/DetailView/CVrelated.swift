//
//  CVrelated.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/28.
//

import Foundation
import UIKit

extension DetailVC {

    func resizeCV(){
        var height = 0
        if userProductsData.count > 3 {
            height = Int(cvCellHeight * 2 + cvLineSpacing * 2)} else { height = Int(cvCellHeight + cvLineSpacing) }
        relatedProductsCV.snp.remakeConstraints {
            $0.height.equalTo(height)
        }
    }
}

extension DetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userProductsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProductCVC", for: indexPath) as? UserProductCVC else { return UICollectionViewCell()}
        cell.setupData(userProductsData[indexPath.row] )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.detailidx = userProductsData[indexPath.row].itemIdx
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cvWidth, height: cvCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cvLineSpacing
    }
    
}
