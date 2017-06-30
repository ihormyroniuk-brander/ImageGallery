//
//  Application.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import SVProgressHUD

class Application {
  
  // MARK: Singleton
  
  static let instance = Application()
  
  // MARK: Setup
  
  static func launchSetup() {
    CoreData.setup()
    SVProgressHUD.setDefaultMaskType(.black)
  }
  
  // MARK: User
  
  var user: User?
  
  static var user: User? {
    get {
      return self.instance.user
    } set {
      self.instance.user = newValue
    }
  }
  
}
