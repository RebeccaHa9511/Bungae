//
//  ViewController.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit
import ImageSlideshow

class MainViewController: BaseViewController, UIScrollViewDelegate{

    //BANNER IMAGES
    var images = [UIImage(named: "banner1"),UIImage(named: "banner2"), UIImage(named: "banner3"), UIImage(named: "banner4"), UIImage(named: "banner5"), UIImage(named: "banner6"), UIImage(named: "banner7"), UIImage(named: "banner8")]
    
    var imageViews = [UIImageView]()
    
    @IBOutlet weak var bannerSlide: ImageSlideshow!
    
    @IBOutlet weak var bannerScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        addContentScrollView()
//        bannerScrollView.delegate = self
        
        bannerSlide.setImageInputs(imageSources)
        bannerSlide.contentScaleMode = .scaleToFill
        
        
    }
    
    let imageSources = [ImageSource(image: UIImage(named: "banner1")!), ImageSource(image: UIImage(named: "banner2")!), ImageSource(image: UIImage(named: "banner3")!), ImageSource(image: UIImage(named: "banner4")!), ImageSource(image: UIImage(named: "banner5")!)]
    
    
    // MARK: - Banner
    
    //스크롤뷰의 콘텐트사이즈의 길이를 imageView의 가로갯수만큼
    private func addContentScrollView() {
           for i in 0..<images.count {
               let imageView = UIImageView()
               let xPos = self.view.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: bannerScrollView.bounds.width, height: bannerScrollView.bounds.height)
               imageView.image = images[i]
               bannerScrollView.addSubview(imageView)
               bannerScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
       }
    
 
    // MARK: - Button Actions
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "FullMenuVC") as! FullMenuVC
        navigationController?.pushViewController(menuVC, animated: true)
        
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let searchVC = UIStoryboard(name: "SearchView", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        searchVC.prtab = false
        navigationController?.pushViewController(searchVC, animated: true)
        
    }
    

}

