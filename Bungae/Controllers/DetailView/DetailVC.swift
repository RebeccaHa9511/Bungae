//
//  DetailVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/22.
//

import UIKit
import ImageSlideshow
import SnapKit
import Tabman

class DetailVC: BaseViewController {


    var productIndexs : String?
    var page = 0
  

    @IBOutlet weak var imageView: ImageSlideshow!

    var productDataResult : ProductDataResult?
    var productData : [ProductDataResult] = []
    var userProductsData : [UsersProductData] = []
    
    //collectionView Property
    var cvWidth = ( Device.width - 40 ) / 3 - 10
    lazy var cvCellHeight = cvWidth * 2.0
    var cvLineSpacing : CGFloat = 5
    
    
//    var detailtitletext : String = ""
    var detailpricetext : String = ""
    var detailContext : String = ""
    var detailLocationText : String = ""
    var detailTime : String = ""
    var detailViewsText : String = ""
    var detailLikesText : String = ""
    var detailidx : String = ""
    var detailTitleText : String = ""
    

    @IBOutlet weak var detailPriceLbl: UILabel!
    @IBOutlet weak var detailTitleLbl: UILabel!

    @IBOutlet weak var detailLocationLbl: UILabel!
    @IBOutlet weak var detailTimeLbl: UILabel!

    @IBOutlet weak var conetentsLbl: UILabel!

    @IBOutlet weak var detailViewsLbl: UILabel!
    @IBOutlet weak var detailLikesCountLbl: UILabel!
    @IBOutlet weak var detailComments: UILabel!

    @IBOutlet weak var firstHashTag: UILabel!
    @IBOutlet weak var secondHashTag: UILabel!
    @IBOutlet weak var thirdHashTag: UILabel!
    @IBOutlet weak var fourthHashTag: UILabel!


    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var followerCount: UILabel!

    @IBOutlet weak var stockCount: UILabel!

    @IBOutlet weak var relatedProductsCV: UICollectionView!
    @IBOutlet weak var reviewsTV: UITableView!
    
    //BUTTON
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var allProductButton: UIButton!
    @IBOutlet weak var allReviewButton: UIButton!
    @IBOutlet weak var bunChatButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    
    @IBOutlet weak var withButton: UIButton!
    
    var getimage : [AlamofireSource] = []

    let productImageCountView : UIView = {
       let view = UIView()
        view.backgroundColor = .darkGray
        view.alpha = 0.4
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()

    
    
    override func viewWillAppear(_ animated: Bool) {
        navBarHidden()
        tabBarHidden()


    }

    override func viewWillDisappear(_ animated: Bool) {
        navBarAppear()
        tabBarAppear()
    }


    // MARK: - view did load

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()


        relatedProductsCV.delegate = self
        relatedProductsCV.dataSource = self

        configureUI()
        
        detailTitleLbl.text = detailTitleText
        detailPriceLbl.text = detailpricetext + "원"
        detailLikesCountLbl.text = detailLikesText
        detailTimeLbl.text = detailTime
        detailLocationLbl.text = detailLocationText
        detailViewsLbl.text = detailViewsText
        conetentsLbl.text = detailContext
        detailLocationLbl.text = detailLocationText
        detailLikesCountLbl.text = detailLikesText
        
        //NETWORKING RESULTS
        getAllRecomProducts()
        getUserProducts()
        
        


    }
    
    // MARK: - UI
    
    func configureUI(){
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        withButton.setBackgroundImage(UIImage(named: "선택하트"), for: .selected)
        
        payButton.layer.cornerRadius = 10
        payButton.clipsToBounds = true
        bunChatButton.layer.cornerRadius = 10
        bunChatButton.clipsToBounds = true
        followButton.layer.cornerRadius = 10
        followButton.clipsToBounds = true
        allProductButton.layer.cornerRadius = 10
        allProductButton.clipsToBounds = true
        allReviewButton.layer.cornerRadius = 10
        allReviewButton.clipsToBounds = true
        
    }
    

    // MARK: - Setup image

    private func setupImage(){
        
        let labelIndicator = LabelPageIndicator()
        labelIndicator.textColor = .white

        imageView.pageIndicator = labelIndicator

        imageView.addSubview(productImageCountView)
        imageView.bringSubviewToFront(labelIndicator)
        productImageCountView.snp.makeConstraints {
            $0.center.equalTo(labelIndicator.snp.center)
            $0.width.equalTo(labelIndicator).offset(15)
            $0.height.equalTo(labelIndicator).offset(18)
        }
        imageView.pageIndicatorPosition = .init(horizontal: .right(padding: 20), vertical: .customBottom(padding: 20))

        imageView.contentMode = .scaleAspectFill

    }
    
    
     func setImageData(_ data : ProductDataResponse){
        self.productDataResult = data.result
        
        if data.result.images.count == 1 {
            productImageCountView.isHidden = true
        }
        
        detailTitleLbl.text = data.result.name
        
        for imageData in data.result.images{
            getimage.append( AlamofireSource(urlString: imageData)! )
        }
        
        imageView.setImageInputs(getimage)
    }
    

// MARK: - USER product DATA setup
    
    func setupUserProduct(_ data : UsersProduct){
        stockCount.text = String(data.count)
        userProductsData = data
        relatedProductsCV.reloadData()
        
    }


// MARK: - BUTTON ACTIONS

    @IBAction func allProductButtonTapped(_ sender: UIButton) {
       

    }

    @IBAction func allReviewsButtonTapped(_ sender: UIButton) {

    }


    @IBAction func chatButtonTapped(_ sender: UIButton) {
        
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        let radioVC = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "BunPayRadioView") as! BunPayRadioView
        
        radioVC.detailIDX = productDataResult?.idx ?? "1"

        
        navigationController?.pushViewController(radioVC, animated: true)

    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        
        withButton.isSelected = !withButton.isSelected
        if withButton.isSelected{
            withButton.tintColor = .ThisRed
            postHeart()
           
            
        } else{
            withButton.tintColor = .lightGray
            deleteHeart()
            
        }
    }
}

// MARK: - custom indicator

extension LabelPageIndicator {
    
    public func setCustomLabel() {
        self.textColor = .white
        let systemFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.attributedText = NSAttributedString(string: self.text ?? "",
                                                 attributes: [NSAttributedString.Key.font : systemFont])
    }
    
    public override func sizeToFit() {
        let maximumString = String(repeating: "16", count: numberOfPages) as NSString
        self.frame.size = maximumString.size(withAttributes: [.font: font as Any])
        setCustomLabel()
    }
}



