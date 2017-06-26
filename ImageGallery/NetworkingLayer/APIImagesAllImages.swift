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
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = () -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
  private static let allImagesEndpoint = "/all"
  
  private static let URLString: String = API.baseURL + APIImagesAllImages.allImagesEndpoint
  
  private static func headersWith(token: String?) -> HTTPHeaders {
    let headers: HTTPHeaders = [
      "token": token ?? ""
    ]
    return headers
  }
  
  public static func requestWith(token: String?) {
    let headers = APIImagesAllImages.headersWith(token: token)
    Alamofire.request(APIImagesAllImages.URLString, headers: headers).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
        print(responseJSON)
      } else {
        
      }
    }
  }
  
}
