//
//  APIImagesAll.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIImagesAllImages {
  
  // MARK: Input
  
  private static let allImagesEndpoint = "/all"
  
  private static let URLString: String = API.baseURL + APIImagesAllImages.allImagesEndpoint
  
  // MARK: Execution
  
  public static func requestWith(token: String?,
                                 success: successAPIUserSignUpCompletionHandlerAPIUserLogIn?,
                                 failure: errorAPIUserSignUpCompletionHandlerAPIUserLogIn?) {
    let headers = API.headersWith(token: token)
    Alamofire.request(APIImagesAllImages.URLString, headers: headers).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
        print(responseJSON)
        let images = APIImagesAllImages.imagesFrom(responseJSON: responseJSON)
        let GIFImages = APIImagesAllImages.GIFImagesFrom(responseJSON: responseJSON)
        success?(images, GIFImages)
      } else {
        let error = NSError()
        failure?(error)
      }
    }
  }
  
  // MARK: Output
  
  private static func imagesFrom(responseJSON: JSON) -> [Image] {
    var images: [Image] = []
    if responseJSON["images"] != JSON.null {
      guard let imagesJSONArray = responseJSON["images"].array else {
        return images
      }
      for imageJSON in imagesJSONArray {
        let image = Image()
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
  
  private static func GIFImagesFrom(responseJSON: JSON) -> [GIFImage] {
    var GIFImages: [GIFImage] = []
    if responseJSON["gif"] != JSON.null {
      guard let imagesJSONArray = responseJSON["gif"].array else {
        return GIFImages
      }
      for imageJSON in imagesJSONArray {
        let gifImage = GIFImage()
        gifImage.id = imageJSON["id"].int
        gifImage.weather = imageJSON["weather"].string
        gifImage.URLString = imageJSON["path"].string
        GIFImages.append(gifImage)
      }
    }
    return GIFImages
  }
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ images: [Image], _ GIFImages: [GIFImage]) -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
}
