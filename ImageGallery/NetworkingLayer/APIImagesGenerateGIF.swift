//
//  APIImagesGenerateGIF.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIImagesGenerateGIF {
  
  typealias successAPIImagesGenerateGIFCompletionHandler = (_ GIFURL: URL) -> Void
  typealias errorAPIImagesGenerateGIFompletionHandler = (_ error: Error) -> Void
  
  private static let endpoint = "/gif"
  
  private static let URLString: String = API.baseURL + APIImagesGenerateGIF.endpoint
  
  private static func headersWith(token: String?) -> HTTPHeaders {
    let headers: HTTPHeaders = [
      "token": token ?? ""
    ]
    return headers
  }
  
  private static func parametersWith(weather: String?) -> [String : Any] {
    let parameters: [String : Any] = [
      "weather": weather ?? ""
    ]
    return parameters
  }

  
  public static func requestWith(token: String?,
                                 weather: String?,
                                 success: @escaping successAPIImagesGenerateGIFCompletionHandler,
                                 failure: @escaping errorAPIImagesGenerateGIFompletionHandler) {
    let headers = APIImagesGenerateGIF.headersWith(token: token)
    let parameters = APIImagesGenerateGIF.parametersWith(weather: weather)
    Alamofire.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
      let responseJSON = JSON(data: response.data!)
      print(responseJSON)
      if response.response?.statusCode == 200 {
        let GIFURL = APIImagesGenerateGIF.GIFURLFrom(responseJSON: responseJSON)
        success(GIFURL)
      } else {
        
      }
    }
  }
  
  private static func GIFURLFrom(responseJSON: JSON) -> URL {
    return URL(string: responseJSON["gif"].stringValue)!
  }
  
}
