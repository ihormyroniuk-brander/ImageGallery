//
//  FileSystem.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation

class FileSystem: NSObject {
  
  // MARK: Documents Directory
  
  private static var documentsDirectory: URL {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.endIndex-1]
  }
  
  // MARK: ImageGallery.sqlite
  
  private static let ImageGallerySQLiteFileName = "ImageGallery.sqlite"
  
  static var imageGallerySQLiteFile: URL {
    let documentsDirectory = self.documentsDirectory
    let imageGallerySQLiteFile = documentsDirectory.appendingPathComponent(self.ImageGallerySQLiteFileName)
    return imageGallerySQLiteFile
  }
  
}
