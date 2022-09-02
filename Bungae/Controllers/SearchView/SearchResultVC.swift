//
//  SearchResultVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class SearchResultVC: BaseViewController {

    
    @IBOutlet weak var serachCollectionView: UICollectionView!
    
    let searchNetworkManager = SearchNetworkManager()
    var searchData : [SearchResponse] = []
    
    
    var searchDataResult : SearchResponse?
    var page = 0
    var previousTab = false
    var searchTerm : String?
    
    var cvWidth = (Device.width - 70) / 2 - 5
    lazy var cvcHeight = cvWidth * 2.0
    var cvSpacing = 5
    
 // MARK: - View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serachCollectionView.delegate = self
        serachCollectionView.dataSource = self
        
        setupData()
        notification()
        
        let nib = UINib(nibName: "SearchCVC", bundle: nil)
        serachCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCVC")

  
    }
    
    // MARK: - View will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navBarHidden()
        tabBarHidden()
        
        searchData = []
        
        setupData()

        
    }
    
    // MARK: - button actions
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    // MARK: - Get data
    
    func loadData(_ data: [SearchResponse]){
        searchData.append(contentsOf: data)
        serachCollectionView.reloadData()
        
        
    }
    
    @objc private func getPage(_ notification : Notification){
        if (searchData.count / 6 == page + 1){
            page = page + 1
            setupData()
        }
    }
    
    private func notification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getPage), name: NSNotification.Name("getRecommend"), object: nil)
    }

    func setupData(){
        
        SearchNetworkManager.shared.getProduct(name: searchTerm!, count: 1) { response in
            switch response {

            case .success(let data) :

                let responseData = data as! SearchResponses

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

}




// MARK: - Collection view delegates

extension SearchResultVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCVC", for: indexPath) as? SearchCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(searchData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        detailVC.detailidx = searchData[indexPath.row].itemIdx
        
        navigationController?.pushViewController(detailVC, animated: true)
  
    }
    
    
    
    
}

extension SearchResultVC : UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    
}
