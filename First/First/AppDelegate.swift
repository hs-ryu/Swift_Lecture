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
        makeUIUsingCode()
        
        return true
    }
    
    func makeUIUsingCode() {
        window = UIWindow()
        window?.backgroundColor = UIColor.gray
        
        // View를 만들어 window 안에 넣기
        let rc = CGRect(x:100, y:200, width: 200, height: 400)
        let view = UIView(frame: rc)
        view.backgroundColor = UIColor.yellow
        window?.addSubview(view)

        // button을 만들어 View 안에 넣기
        let btn = UIButton(type: .roundedRect)
        // let bt = UIButton(type: .roundedRect)
        btn.frame = CGRect(x:50, y:100, width: 100, height: 100)
        btn.backgroundColor = UIColor.green
        view.addSubview(btn)
        
        let vc = FirstViewController()
        vc.view = view
        
        btn.addTarget(vc, action: #selector(FirstViewController.buttonClick), for: .touchUpInside)
        
        window?.rootViewController = vc // vc.view를 윈도우에 자동으로 붙여줌.
        // 윈도우를 보이게 해라!
        window?.makeKeyAndVisible()
        // UI code 작성
    }
    
    
    func makeUIUsingXIB() {
        window = UIWindow()
        window?.backgroundColor = UIColor.gray
        
        // View를 만들어 window 안에 넣기
        let rc = CGRect(x:100, y:200, width: 200, height: 400)
        let view = UIView(frame: rc)
        view.backgroundColor = UIColor.yellow
        window?.addSubview(view)

        // button을 만들어 View 안에 넣기
        let btn = UIButton(type: .roundedRect)
        // let bt = UIButton(type: .roundedRect)
        btn.frame = CGRect(x:50, y:100, width: 100, height: 100)
        btn.backgroundColor = UIColor.green
        view.addSubview(btn)
        
        let vc = FirstViewController()
        vc.view = view
        
        btn.addTarget(vc, action: #selector(FirstViewController.buttonClick), for: .touchUpInside)
        
        window?.rootViewController = vc // vc.view를 윈도우에 자동으로 붙여줌.
        // 윈도우를 보이게 해라!
        window?.makeKeyAndVisible()
        // UI code 작성
    }
}
