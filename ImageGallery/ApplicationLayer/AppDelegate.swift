//
//  AppDelegate.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    /*let image = UIImage(named: "panda")!
    let username = "username10"
    let email = "email10@gmail.com"
    let password = "password1"*/
    /*APIUserSignUp.requestWith(username: username, email: email, password: password, avatar: image, success: {
      APIUserLogIn.requestWith(email: email,
                               password: password,
                               success: { (token, avatarURL, signUpDate) in
                             print(avatarURL)
                                print(token)
      }) { (error) in
        
      }
    }) { (error) in
      
    }*/
    /*APIUserLogIn.requestWith(email: email,
                             password: password,
                             success: { (token, avatarURL, signUpDate) in
                              print(avatarURL)
                              print(token)
    }) { (error) in
      
    }*/
    
    //APIImagesAllImages.requestWith(token: "1976b3c0a8b7941199b43a1456a20ef1")
    
    /*APIImagesAllImages.requestWith(token: "1976b3c0a8b7941199b43a1456a20ef1",
                                   success: { (images, GIFImages) in
                                    
    }) { (error) in
      
    }*/
    
    
    
    
    /*APIImagesAddImage.requestWith(token: "1976b3c0a8b7941199b43a1456a20ef1",
                                  image: image,
                                  description: "sd;fjdskofj",
                                  hashtag: "dkfhjdklsf",
                                  latitude: 6,
                                  longitude: 6)*/
    
    
    /*APIImagesGenerateGIF.requestWith(token: "1976b3c0a8b7941199b43a1456a20ef1",
                                     weather: "Clouds",
                                     success: { (GIFURL) in
                                      print(GIFURL)
    }) { (error) in
      
    }*/
    
    
    
    
    
    
    
    
    Application.launchSetup()
    
    let navigationController = UINavigationController(rootViewController: MainViewController())
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

