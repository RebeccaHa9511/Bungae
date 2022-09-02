//
//  RecommendVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class RecommendVC: BaseViewController {

    //COLLECTION VIEW
    @IBOutlet weak var productCollectionView: UICollectionView!
    var cvWidth = (Device.width - 40) / 2 
    lazy var cvcHeight = cvWidth * 1.8
    var cvSpacing = 10
    
    //DATA STORAGE
    var productData : [ProductDataResult] = []
    var page = 0
    var productDataResult : ProductDataResult?
    
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DELEGATE
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        getAllRecomProducts()
//        notification()
        
    }
    

    // MARK: - Get DATA !!!
    
    //전체상품 조회🌷
    private func getAllRecomProducts(){
        RecomProductDataManager.shared.getProduct(idx: "all") { (response) in
            switch response {

            case .success(let data) :

                let responseData = data as! RecomProductResponse

                if responseData.isSuccess {
                    self.loadData(responseData.result!)
                    print("Response 성공했습니다🌷")
                } else {
                    self.presentBottomAlert(message: "Bottom 입니다🌷")
                }



            case .requestErr(let msg):
                print(msg)
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
    
    func loadData(_ data: [ProductDataResult]){
        productData.append(contentsOf: data)
        productCollectionView.reloadData()
        
        //COLLECTION VIEW SIZE
        let height = (Int(cvcHeight) + cvSpacing) * (productData.count + 1) / 2
        SampleData.shared.height = height
        NotificationCenter.default.post(name: NSNotification.Name("resize"), object: height)
        
    }
    


}

// MARK: - DELEGATES & DATASOURCE

extension RecommendVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomProductCVC", for: indexPath) as? RecomProductCVC else { return UICollectionViewCell() }

        cell.setData(productData[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
//        detailVC.productIndexs = productData[indexPath.row].idx
        
        detailVC.detailTitleText = productData[indexPath.row].name
        detailVC.detailpricetext = productData[indexPath.row].price
        detailVC.detailContext = productData[indexPath.row].content
        detailVC.detailTime = productData[indexPath.row].time
        detailVC.detailViewsText = productData[indexPath.row].hit
        detailVC.detailLocationText = productData[indexPath.row].location
        detailVC.detailLikesText = productData[indexPath.row].wish

        detailVC.detailidx = productData[indexPath.row].idx

        
        navigationController?.pushViewController(detailVC, animated: true)

    }
    
    
    
    //FLOW LAYOUT
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cvSpacing)
    }
    
    //행간 높이
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cvWidth, height: cvcHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 15, bottom: 0, right: 35)
    }
    
    
}
