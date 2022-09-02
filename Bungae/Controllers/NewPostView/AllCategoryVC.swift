//
//  AllCategoryVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/27.
//

import UIKit

class AllCategoryVC: BaseViewController {
    
    @IBOutlet weak var firstTableView: UITableView!
    
    var nextcategoryDelegate : SecondCategoryDelegate?
    var categoryDelegate : FirstCategoryDelegate?
    
    @IBOutlet weak var subCategoryLabel: UILabel!
    
    var subcate : String = ""
    
    
    var categoryCount : Int = 1
    
//    var secondCategoryData :
//    [Result] = [DefaultData.categoryTWO]
//
//    var selectFirstCategoryss = DefaultData.categoryONE
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTableView.delegate = self
        firstTableView.dataSource = self
        
        let nib = UINib(nibName: "AllCategoryTVC", bundle: nil)
        firstTableView.register(nib, forCellReuseIdentifier: "AllCategoryTVC")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
     navBarHidden()
        tabBarHidden()
        getSecondcategoryData()
    }
    
    
    func getSecondcategoryData(){
        SubCategoryDataManager.shared.getSecondCategoryData(categoryCode: "EB0005", count: 6, completion: { (response) in
            switch response {
            case .success(let data) :
                self.setupSecondCate(data as! SubCategoryResponse)
                
            case .requestErr(let msg):
                if let message = msg as?
                    String {
                    print(message)
                }
                
            case.pathErr :
                print("pathERROR")
                
            case.serverErr :
                print("SERVER error")
                
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeError")
                
            }
        })
        
    }
    
    private func setupSecondCate(_ data : SubCategoryResponse ){
        categoryCount = [data.subCategory].count
//        secondCategoryData = [data.subCategory]
        
        firstTableView.reloadData()
        
    }
    
    // MARK: - button action
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
        
    }
    



extension AllCategoryVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllCategoryTVC", for: indexPath) as? AllCategoryTVC else {return UITableViewCell()}
        
        cell.selectionStyle = .none
//        cell.setData(indexPath, secondCategoryData)


        return cell
    }
    
    
    
    
}
