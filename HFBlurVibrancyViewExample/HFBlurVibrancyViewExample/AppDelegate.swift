//
//  AppDelegate.swift
//  HFBlurVibrancyViewExample
//
//  Created by Nestarneal on 2018/07/01.
//  Copyright © 2018年 Han-Feng Lin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        return true
    }
}

