//
//  Image.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation

class IGImage: NSObject {
  var id: Int?
  var details: String?
  var hashtag: String?
  var address: String?
  var weather: String?
  var bigImageURLString: String?
  var smallImageURLString: String?
  var createdDate: Date?
  var longitude: Float?
  var latitude: Float?
}
