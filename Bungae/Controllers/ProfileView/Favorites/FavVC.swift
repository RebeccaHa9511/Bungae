//
//  FavVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit

class FavVC: BaseViewController {

    @IBOutlet weak var favProductCV: UICollectionView!
    
    //COLLECTION VIEW SIZE
    var cvWidth = ( Device.width - 40 ) / 2
    lazy var cvCellHeight = cvWidth * 1.5
    var cvLineSpacing : CGFloat = 5
    
    //PROEPERTY
    var wishListData : [WishResult] = []
    
    
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getFavProducts()
      
        favProductCV.delegate = self
        favProductCV.dataSource = self
        let nib = UINib(nibName: "FavCVC", bundle: nil)
        favProductCV.register(nib, forCellWithReuseIdentifier: "FavCVC")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }
    
    
// MARK: - BUtton Action
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
// MARK: - Data setup
    
    func getFavProducts(){
        WishlistDataManager.shared.getWishlist(page: 1) { (response) in
            switch response {
            case .success(let data) :
                let responseData = data as! WishResponse
                self.setupFavProduct(responseData.result)
                
                self.resizeCV()
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr :
                print("pathErr")
            case .serverErr :
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
            }
        }
    }
    
    func setupFavProduct(_ data : [WishResult]){
        wishListData = data
        favProductCV.reloadData()
        
    }

}

// MARK: - collection view delegates

extension FavVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return wishListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavCVC", for: indexPath) as? FavCVC else { return UICollectionViewCell()}
        cell.setupData(wishListData[indexPath.row] )
        cell.detailidx = wishListData[indexPath.row].itemIdx
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC


        detailVC.detailidx = wishListData[indexPath.row].itemIdx
        
        
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cvWidth, height: cvCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cvLineSpacing
    }
    
    
    func resizeCV(){
        var height = 0
        if wishListData.count > 2 {
            height = Int(cvCellHeight * 2 + cvLineSpacing * 2)} else { height = Int(cvCellHeight + cvLineSpacing) }
        favProductCV.snp.remakeConstraints {
            $0.height.equalTo(height)
        }
    }

    
}
