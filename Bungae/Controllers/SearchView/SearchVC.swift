//
//  SearchVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class SearchVC: BaseViewController {
    
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC)
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var popularCV: UICollectionView!
    @IBOutlet weak var searchHistoryCV: UICollectionView!
    
    var prtab = true
    var searchResult : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //DELEGATES
        searchTextField.delegate = self

//        searchHistoryCV.delegate = self
//        searchHistoryCV.dataSource = self
//        searchHistoryCV.isUserInteractionEnabled = true
//
//        popularCV.delegate = self
//        popularCV.dataSource = self
//        popularCV.isUserInteractionEnabled = true

        

    }
    
    // MARK: - NAV BAR
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        
        searchTextField.becomeFirstResponder()
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarAppear()
        navBarAppear()
        
    }
    
    private func movetoResult(){
        if searchResult != nil {
            let keywordProductVC = UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
            keywordProductVC.previousTab = false
            keywordProductVC.searchTerm = searchResult
            navigationController?.pushViewController(keywordProductVC, animated: true)
        }
        searchTextField.text = ""
        dismissKeyboard()
        
    }
    
    // MARK: - Search
    
    

    @IBAction func deleteButtonTapped(_ sender: UIButton) {
  //Delete Recent Search Manager
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let toMainVC = UIStoryboard(name: "MainHome", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController


        navigationController?.pushViewController(toMainVC, animated: true)
    }
    
    
}



// MARK: - TEXTFIELD
    
extension SearchVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        dismissKeyboardWhenTappedAround()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //removeKeyboardTappedGesture()
        guard let text = textField.text else {return }
        searchResult = !text.isEmpty ? text : nil
        movetoResult()
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
