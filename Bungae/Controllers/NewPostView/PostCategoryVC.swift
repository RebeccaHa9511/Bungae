//
//  PostCategoryVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit

class PostCategoryVC: BaseViewController {

    
    @IBOutlet weak var categoryTableView: UITableView!
    
    //Properties
    var firstCategoryArray : [FirstCategoryData] = []
    var firstCategoryDataManager = FirstCategoryManager()
    
    
    
 // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        let nib = UINib(nibName: "CategoryCVC", bundle: nil)
        categoryTableView.register(nib, forCellReuseIdentifier: "CategoryCVC")
        
        firstCategoryDataManager.makeCateArray()
        firstCategoryArray = firstCategoryDataManager.getData()

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
     navBarHidden()
        tabBarHidden()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    // MARK: - button action
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }

    

    
}

// MARK: - delegate extentions
extension PostCategoryVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstCategoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCVC", for: indexPath) as? CategoryCVC else {return UITableViewCell()}
        
        cell.selectionStyle = .none
        cell.categoryLbl.text = firstCategoryArray[indexPath.row].name


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let secondCategoryVC = UIStoryboard(name: "NewPost", bundle: nil).instantiateViewController(withIdentifier: "AllCategoryVC") as! AllCategoryVC
        
        
        
        navigationController?.pushViewController(secondCategoryVC, animated: true)
        
    }
    
    
    
    
}


