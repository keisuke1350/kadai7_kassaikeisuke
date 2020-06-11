//
//  AppDelegate.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/08.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var myNavigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // ViewControllerを生成.
        let myViewController: ViewController = ViewController()
        // Navication Controllerを生成.
        myNavigationController = UINavigationController(rootViewController: myViewController)

        // UIWindowを生成.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        // rootViewControllerにNatigationControllerを設定.
        self.window?.rootViewController = myNavigationController

        self.window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

