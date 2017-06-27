//
//  FileSystem.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation

import UIKit

class FileSystem: NSObject {
  
  static var ImageGallerySQLite: URL {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let docURL = urls[urls.endIndex-1]
    let storeURL = docURL.appendingPathComponent("ImageGallery.sqlite")
    return storeURL
  }
  
}
