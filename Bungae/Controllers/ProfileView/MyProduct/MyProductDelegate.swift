//
//  MyProductDelegate.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/30.
//

import Foundation
import UIKit

extension ProfileVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userProductsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProductCVC", for: indexPath) as? MyProductCVC else { return UICollectionViewCell()}
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
