//
//  AppDelegate.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Application.launchSetup()
    
    let navigationController = UINavigationController(rootViewController: LogInViewController())
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    return true
  }

}

