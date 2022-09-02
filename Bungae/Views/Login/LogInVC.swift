//
//  LogInVC.swift
//  Bungae
//
//  Created by Rebecca Ha on 2022/08/21.
//

import UIKit
import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
import ImageSlideshow

class LogInVC: BaseViewController, UIScrollViewDelegate {

    var images = [UIImage(named: "loginbanner1"),UIImage(named: "loginbanner2"), UIImage(named: "loginbanner3"), UIImage(named: "loginbanner4")]
    
    var imageViews = [UIImageView]()
    
    @IBOutlet weak var imageSlide: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSlide.setImageInputs(imageInputs)
        imageSlide.contentScaleMode = .scaleAspectFit
      

    }
    
    let imageInputs = [ImageSource(image: UIImage(named: "loginbanner1")!), ImageSource(image: UIImage(named: "loginbanner2")!), ImageSource(image: UIImage(named: "loginbanner3")!), ImageSource(image: UIImage(named: "loginbanner4")!)]
    
 
    
    // MARK: - BUTTON ACTION
    
    @IBAction func kakaoLogInTapped(_ sender: UIButton) {
        // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
        
          UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
             if let error = error {
               print(error)
             }
             else {
                 KaKaogetJWTManager.shared.checkAccessToken(token: "\(String(describing: oauthToken))")  { response in
                     print("loginWithKakaoAccount() success.")
                   
                        
                     User.shared.jwtToken = Keys.KAKAO_JWT
                     User.shared.userId = Keys.KAKAO_NATIVE_APP_KEY
                        
                        UserDefaults.standard.set(User.shared.userId, forKey: "userID")
                        UserDefaults.standard.set(User.shared.jwtToken, forKey: "JWT_TOKEN")
                        
                        let mainVC = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                        self.changeRootViewController(mainVC)

                     //do something
                     _ = oauthToken

                        self.setUserInfo()
                 }
          
             }
          }
        
        
    }
    
    func setUserInfo() {
        //사용자 관리 api 호출
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
        //do something
                _ = user
                
            }
        }
    }
    
    
    
    @IBAction func appleLoginTapped(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func otherLoginTapped(_ sender: UIButton) {
        let otherVC = storyboard?.instantiateViewController(withIdentifier: "OtherLoginVC") as! OtherLoginVC
        navigationController?.pushViewController(otherVC, animated: true)
        
    }
    
}
