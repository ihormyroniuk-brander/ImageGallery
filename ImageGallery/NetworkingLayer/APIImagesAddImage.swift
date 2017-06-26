//
//  APIImagesAddImage.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIImagesAddImage {
  
  typealias successAPIImagesAddImageCompletionHandler = (_ smallImageURL: URL, _ bigImageURL: URL, _ address: String, _ weather: String?) -> Void
  typealias errorAPIImagesAddImageCompletionHandler = (_ error: Error) -> Void
  
  private static let addImageEndpoint = "/image"
  
  private static let URLString: String = API.baseURL + APIImagesAddImage.addImageEndpoint
  
  private static func headersWith(token: String?) -> HTTPHeaders {
    let headers: HTTPHeaders = [
      "token": token ?? ""
    ]
    return headers
  }
  
  private static func parametersWith(description: String?,
                                     hashtag: String?,
                                     latitude: Float?,
                                     longitude: Float?) -> [String : Any] {
    let parameters: [String : Any] = [
      "description": description ?? "",
      "hashtag": hashtag ?? "",
      "latitude": "0",
      "longitude": "0"
    ]
    return parameters
  }
  
  public static func requestWith(token: String?,
                                 image: UIImage,
                                 description: String?,
                                 hashtag: String?,
                                 latitude: Float?,
                                 longitude: Float?) {
    let headers = APIImagesAddImage.headersWith(token: token)
    let parameters = APIImagesAddImage.parametersWith(description: description, hashtag: hashtag, latitude: latitude, longitude: longitude)
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(UIImagePNGRepresentation(image)!, withName: "image", fileName: "image", mimeType: "image/png")
      for (key, value) in parameters {
        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
      }
    },
                     usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
                     to: URLString,
                     method: .post,
                     headers: headers,
                     encodingCompletion: { (result) in
                      switch result {
                      case .success(let upload, _, _):
                        
                        upload.uploadProgress(closure: { (progress) in
                          //Print progress
                        })
                        
                        upload.responseJSON { response in
                          let responseJSON = JSON(data: response.data!)
                          print(responseJSON)
                          if response.response?.statusCode == 201 {
                            
                          } else {
                            
                          }
                        }
                        
                      case .failure( _): break
                        //print encodingError.description
                      }
    })
    
  }
  
}
