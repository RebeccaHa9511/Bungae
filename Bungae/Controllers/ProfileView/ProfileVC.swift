//
//  ProfileVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/20.
//

import UIKit

class ProfileVC: BaseViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var shopnameLbl: UILabel!
    @IBOutlet weak var countProductLbl: UILabel!
    
    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var myProductCollectionView: UICollectionView!
    
    //Property
    var userProductsData : [UsersProductData] = []
    
    var cvWidth = ( Device.width - 40 ) / 3 - 10
    lazy var cvCellHeight = cvWidth * 2.0
    var cvLineSpacing : CGFloat = 5
    
    
    // MARK: - viewdidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProfileData()
        getUserProducts()
        
        myProductCollectionView.delegate = self
        myProductCollectionView.dataSource = self
        
        let nib = UINib(nibName: "MyProductCVC", bundle: nil)
        myProductCollectionView.register(nib, forCellWithReuseIdentifier: "MyProductCVC")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     navBarHidden()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      navBarAppear()
    }
    

    
    // MARK: - GET DATA
    private func getProfileData(){
        ProfileDataManager.shared.getmyProfile {
            switch $0 {
            case .success(let data) :
                let response = data as! ProfileData
                self.setupProfile(response)
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
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
    
    func setupProfile(_ data: ProfileData){
        
        profileImageView.kingfisher(urlString: data.storeImage)
        shopnameLbl.text = data.storeName
        
        favLabel.text = data.wishLists
        reviewLabel.text = data.reviews
        followerLabel.text = data.followers
        followingLabel.text = data.followings
    }
    
    func getUserProducts(){
        UserProductDataManager.shared.getUserProduct(condition: "Y" ) { (response) in
            switch response {
            case .success(let data) :
                let responseData = data as! UsersProduct
                    self.setupUserProduct(responseData)
                
                self.resizeCV()
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
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
    
    func setupUserProduct(_ data : UsersProduct){
        userProductsData = data
        myProductCollectionView.reloadData()
        
    }
    
    func resizeCV(){
        var height = 0
        if userProductsData.count > 3 {
            height = Int(cvCellHeight * 2 + cvLineSpacing * 2)} else { height = Int(cvCellHeight + cvLineSpacing) }
        myProductCollectionView.snp.remakeConstraints {
            $0.height.equalTo(height)
        }
    }

    // MARK: - BUTTON ACTION
    
    @IBAction func followingButtonTapped(_ sender: UITapGestureRecognizer) {
        let followingVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "FollowingVC") as! FollowingVC
        
        navigationController?.pushViewController(followingVC, animated: true)
        
    }
    
    @IBAction func reviewButtonTapped(_ sender: UITapGestureRecognizer) {
        let reviewVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "ReviewVC") as! ReviewVC
        
        navigationController?.pushViewController(reviewVC, animated: true)
    }
    
    
    @IBAction func followerButtonTapped(_ sender: UITapGestureRecognizer) {
        let followerVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "FollowerVC") as! FollowerVC
        
        navigationController?.pushViewController(followerVC, animated: true)
    }
    
    
    @IBAction func favButtonTapped(_ sender: UITapGestureRecognizer) {
        let heartListVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "FavVC") as! FavVC
        
        navigationController?.pushViewController(heartListVC, animated: true)
        
    }

    
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
        let statusChangeVC = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "StatusPopupVC") as! StatusPopupVC
        
        navigationController?.pushViewController(statusChangeVC, animated: true)
        
    }
    
    
    
}
