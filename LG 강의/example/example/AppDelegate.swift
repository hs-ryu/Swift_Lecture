//
//  AppDelegate.swift
//  example
//
//  Created by ryu hyunsun on 2023/09/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = .white
        
        let vc = FirstViewController(nibName: "FirstViewController", bundle: nil)
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }


}

