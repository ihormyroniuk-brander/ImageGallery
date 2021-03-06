//
//  APIImagesGenerateGIF.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIGIFsGenerateGIF {
  
  // MARK: Input
  
  private static let endpoint = "/gif"
  
  private static let URLString: String = API.baseURL + APIGIFsGenerateGIF.endpoint
  
  private static func parametersWith(weather: String?) -> [String : Any] {
    let parameters: [String : Any] = [
      "weather": weather ?? ""
    ]
    return parameters
  }

  public static func requestWith(token: String?,
                                 weather: String?,
                                 success: successAPIImagesGenerateGIFCompletionHandler?,
                                 failure: errorAPIImagesGenerateGIFompletionHandler?) {
    let headers = API.headersWith(token: token)
    let parameters = self.parametersWith(weather: weather)
    Alamofire.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
      let responseJSON = JSON(data: response.data!)
      print(responseJSON)
      if response.response?.statusCode == 200 {
        let GIFURL = self.GIFURLFrom(responseJSON: responseJSON)
        success?(GIFURL)
      } else {
        let error = NSError()
        failure?(error)
      }
    }
  }
  
  // MARK: Output
  
  private static func GIFURLFrom(responseJSON: JSON) -> URL {
    return URL(string: responseJSON["gif"].stringValue)!
  }
  
  typealias successAPIImagesGenerateGIFCompletionHandler = (_ GIFURL: URL) -> Void
  typealias errorAPIImagesGenerateGIFompletionHandler = (_ error: Error) -> Void
  
}
