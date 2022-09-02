//
//  SortBottomView.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/26.
//

import UIKit



class SortBottomView: BaseViewController {

    @IBOutlet weak var selectButton: UIButton!

    @IBOutlet var buttonList: [UIButton]!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var adView: UIView!
    
    var filter : Sort = Sort.recent
    var sortingDelegate : SortDelegate?
    
    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setFilterView()
    }
    
    // MARK: - configure ui
    
    func configureUI(){
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        
        selectButton.layer.cornerRadius = 10
        selectButton.clipsToBounds = true

        
        adView.layer.cornerRadius = 10
        adView.clipsToBounds = true
        
    }
    
    func setFilterView() {
        
        switch filter {
        case .recent:
            buttonList[0].isSelected = true
            buttonList[1].isSelected = false
            buttonList[2].isSelected = false
            
        
        case .lowPrice:
            buttonList[0].isSelected = false
            buttonList[1].isSelected = true
            buttonList[2].isSelected = false
            
        case .highPrice:
            buttonList[0].isSelected = false
            buttonList[1].isSelected = false
            buttonList[2].isSelected = true
            
        }
        
    }
    
// MARK: - button action
    
    @IBAction func fileterButtonTapped (_ sender: UIButton) {
        for button in buttonList {
                   if button == sender {
                       button.isSelected = true
                       filter = button.sorting
                   } else {
                       button.isSelected = false
                      
                   }
        }
        
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        sortingDelegate?.sendSorting(filter)
        
        dismiss(animated: true)
        
    }
    
  

}
