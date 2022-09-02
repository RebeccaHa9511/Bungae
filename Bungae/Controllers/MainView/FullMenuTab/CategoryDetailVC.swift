//
//  CategoryDetailVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/09/01.
//

import UIKit

class CategoryDetailVC: BaseViewController {
    
    @IBOutlet weak var categorycollectionView: UICollectionView!
    
    let cateDataManager = SubCategoryDataManager()
    var cateData : [CategoryItem] = []
    
    //property
    var cvWidth = (Device.width - 40) / 3
    lazy var cvcHeight = cvWidth * 2.0
    var cvSpacing = 3
    
    var categoryItemResult : CategoryItem?
    
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        categorycollectionView.delegate = self
        categorycollectionView.dataSource = self
        
        let nib = UINib(nibName: "CateProductCVC", bundle: nil)
        categorycollectionView.register(nib, forCellWithReuseIdentifier: "CateProductCVC")
        
        
        setupData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHidden()
        tabBarHidden()

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }
    
    
    // MARK: - get data
    
    func loadData(_ data: [CategoryItem]){
        cateData.append(contentsOf: data)
        categorycollectionView.reloadData()
        
        
    }
    
    func setupData(){
        
        SubCategoryDataManager.shared.getSecondCategoryData(categoryCode: "EB01", count: 1) { response in
            switch response {

            case .success(let data) :

                let responseData = data as! SubCategoryData

                if responseData.isSuccess {
                    self.loadData(responseData.result.items)
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
    
    
    // MARK: - Button action
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        let searchVC = UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        let mainVC = UIStoryboard(name: "MainHome", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        navigationController?.pushViewController(mainVC, animated: true)
        
        
    }
    
    
    

}

extension CategoryDetailVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cateData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CateProductCVC", for: indexPath) as? CateProductCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(cateData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        detailVC.detailidx = cateData[indexPath.row].itemIdx
        
        navigationController?.pushViewController(detailVC, animated: true)
  
    }
    
    
    
    
}

extension CategoryDetailVC : UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    
}
