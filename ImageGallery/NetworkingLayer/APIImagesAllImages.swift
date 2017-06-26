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
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ smallImageURL: URL, _ bigImageURL: URL, _ address: String, _ weather: String?) -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
  private static let allImagesEndpoint = "/all"
  
  private static let URLString: String = API.baseURL + APIImagesAllImages.allImagesEndpoint
  
  public static func requestWith(token: String?) {
    let headers = API.headersWith(token: token)
    Alamofire.request(APIImagesAllImages.URLString, headers: headers).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
      } else {
        
      }
    }
  }
  
}
