//
//  APIImagesAddImage.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIImagesAddImage {
  
  // MARK: Input
  
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
      "latitude": "\(latitude ?? 0)",
      "longitude": "\(longitude ?? 0)"
    ]
    return parameters
  }
  
  // MARK: Execution
  
  public static func requestWith(token: String?,
                                 image: UIImage,
                                 description: String?,
                                 hashtag: String?,
                                 latitude: Float?,
                                 longitude: Float?,
                                 success: successAPIImagesAddImageCompletionHandler?,
                                 failure: errorAPIImagesAddImageCompletionHandler?) {
    let headers = APIImagesAddImage.headersWith(token: token)
    let parameters = APIImagesAddImage.parametersWith(description: description, hashtag: hashtag, latitude: latitude, longitude: longitude)
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      let imagePNG = UIImagePNGRepresentation(image)!
      multipartFormData.append(imagePNG, withName: "image", fileName: "image", mimeType: "image/png")
      for (key, value) in parameters {
        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
      }
    }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: URLString, method: .post, headers: headers, encodingCompletion: { (result) in
      switch result {
      case .success(let upload, _, _):
        upload.responseJSON { response in
          let responseJSON = JSON(data: response.data!)
          if response.response?.statusCode == 201 {
            let image = APIImagesAddImage.imageFrom(responseJSON: responseJSON)
            success?(image)
          } else {
            let error = NSError()
            failure?(error)
          }
        }
      case .failure(let error):
        failure?(error)
      }
    })
  }
  
  // MARK: Output
  
  private static func imageFrom(responseJSON: JSON) -> Image {
    let image = Image()
    image.smallImageURLString = responseJSON["smallImage"].stringValue
    image.bigImageURLString = responseJSON["bigImage"].stringValue
    image.address = responseJSON["parameters"]["address"].stringValue
    image.weather = responseJSON["parameters"]["weather"].stringValue
    return image
  }
  
  typealias successAPIImagesAddImageCompletionHandler = (_ image: Image) -> Void
  typealias errorAPIImagesAddImageCompletionHandler = (_ error: Error) -> Void
  
}
