//
//  Application.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation

class Application: NSObject {
  
  static let instance = Application()
  
  static func launchSetup() {
    CoreData.setup()
  }
  
  static var user: User? {
    return nil
  }
  
}
