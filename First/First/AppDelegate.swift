//
//  AppDelegate.swift
//  First
//
//  Created by ryu hyunsun on 2023/09/04.
//

import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.gray
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        // UI code 작성
        return true
    }
}
