//
//  DetailStoreVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/29.
//

import UIKit

class DetailStoreVC: BaseViewController {

    
    @IBOutlet weak var storeTableViewone: UITableView!
    
    //Properties
    var firstMenuArray : [SellHistoryData] = []
    var firstMenuDataManager = SellHistoryDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storeTableViewone.delegate = self
        storeTableViewone.dataSource = self
        
        firstMenuDataManager.makesellArray()
        firstMenuArray = firstMenuDataManager.getData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }
    
    // MARK: - button action
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
  

}

extension DetailStoreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstMenuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstMenuTVC", for: indexPath) as! FirstMenuTVC
        
        cell.menuImageView.image = firstMenuArray[indexPath.row].tableImg
        cell.menuLabel.text = firstMenuArray[indexPath.row].tableLabel
        
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
