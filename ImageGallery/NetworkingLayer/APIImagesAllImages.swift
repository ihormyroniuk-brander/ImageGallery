//
//  APIImagesAll.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIImagesAllImages {
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ images: [IGImage], _ GIFImages: [IGGIFImage]) -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
  private static let allImagesEndpoint = "/all"
  
  private static let URLString: String = API.baseURL + APIImagesAllImages.allImagesEndpoint
  
  public static func requestWith(token: String?,
                                 success: successAPIUserSignUpCompletionHandlerAPIUserLogIn?,
                                 failure: errorAPIUserSignUpCompletionHandlerAPIUserLogIn?) {
    let headers = API.headersWith(token: token)
    Alamofire.request(APIImagesAllImages.URLString, headers: headers).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
        let images = APIImagesAllImages.imagesFrom(responseJSON: responseJSON)
        let GIFImages = APIImagesAllImages.GIFImagesFrom(responseJSON: responseJSON)
        if let success = success {
          success(images, GIFImages)
        }
      } else {
        
      }
    }
  }
  
  private static func imagesFrom(responseJSON: JSON) -> [IGImage] {
    var images: [IGImage] = []
    if responseJSON["images"] != JSON.null {
      guard let imagesJSONArray = responseJSON["images"].array else {
        return images
      }
      for imageJSON in imagesJSONArray {
        let image = IGImage()
        image.id = imageJSON["id"].int
        image.details = imageJSON["description"].string
        image.hashtag = imageJSON["hashtag"].string
        image.bigImageURLString = imageJSON["bigImagePath"].string
        image.smallImageURLString = imageJSON["smallImagePath"].string
        image.longitude = imageJSON["parameters"]["longitude"].floatValue
        image.latitude = imageJSON["parameters"]["latitude"].floatValue
        image.weather = imageJSON["parameters"]["weather"].string
        image.address = imageJSON["parameters"]["address"].string
        images.append(image)
      }
    }
    return images
  }
  
  private static func GIFImagesFrom(responseJSON: JSON) -> [IGGIFImage] {
    var GIFImages: [IGGIFImage] = []
    if responseJSON["gif"] != JSON.null {
      guard let imagesJSONArray = responseJSON["gif"].array else {
        return GIFImages
      }
      for imageJSON in imagesJSONArray {
        let GIFImage = IGGIFImage()
        GIFImage.id = imageJSON["id"].int
        GIFImage.weather = imageJSON["weather"].string
        GIFImage.URLString = imageJSON["path"].string
        GIFImages.append(GIFImage)
      }
    }
    return GIFImages
  }
  
}
