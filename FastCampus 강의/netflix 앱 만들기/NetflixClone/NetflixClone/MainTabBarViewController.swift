//
//  ViewController.swift
//  NetflixClone
//
//  Created by ryu hyunsun on 2022/07/11.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .systemYellow
        // 각각의 요소를 네비게이션 컨트롤러 걸어주기.
        // rootview = 
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
    
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"

        // 탭바 색깔 설정.
        tabBar.tintColor = .label
        
        // tabbar 뷰 띄우기
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

