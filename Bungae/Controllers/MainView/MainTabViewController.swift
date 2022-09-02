//
//  MainTabViewController.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit
import Tabman
import Pageboy

class MainTabViewController : TabmanViewController{
    
    @IBOutlet weak var tabControllView: UIView!
    
    
    private let recommendVC = UIStoryboard.init(name: "MainHome", bundle: nil).instantiateViewController(withIdentifier: "RecommendVC") as! RecommendVC
    private let brandVC = UIStoryboard.init(name: "MainHome", bundle: nil).instantiateViewController(withIdentifier: "BrandVC") as! BrandVC
    
    private lazy var viewControllers : Array<UIViewController> = [recommendVC,brandVC]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
        
        //DELEGATE
        self.dataSource = self
        
        
    }
    
    
    private func configureTabbar(){
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .flat(color: .white)
        
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        
        bar.indicator.weight = .custom(value: 2.8)
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit

           
        addBar(bar, dataSource: self, at: .custom(view: tabControllView, layout: .none))
    }
    

    
}

extension MainTabViewController : PageboyViewControllerDataSource, TMBarDataSource{
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "추천 상품")
        case 1:
            return TMBarItem(title: "브랜드")
            
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        print(viewControllers.count)
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
    
    
    
}
