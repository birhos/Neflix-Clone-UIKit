//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Haydar Demir on 22.09.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: MainTabbarImages.Home.rawValue)
        vc2.tabBarItem.image = UIImage(systemName: MainTabbarImages.ComingSoon.rawValue)
        vc3.tabBarItem.image = UIImage(systemName: MainTabbarImages.Search.rawValue)
        vc4.tabBarItem.image = UIImage(systemName: MainTabbarImages.Downloads.rawValue)
        
        vc1.title = MainTabbarTitles.Home.rawValue
        vc2.title = MainTabbarTitles.ComingSoon.rawValue
        vc3.title = MainTabbarTitles.Search.rawValue
        vc4.title = MainTabbarTitles.Downloads.rawValue
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

enum MainTabbarTitles: String {
    case Home = "Home"
    case ComingSoon = "Coming Soon"
    case Search = "Top Search"
    case Downloads = "Downloads"
}

enum MainTabbarImages: String {
    case Home = "house"
    case ComingSoon = "play.circle"
    case Search = "magnifyingglass"
    case Downloads = "arrow.down.to.line"
}
