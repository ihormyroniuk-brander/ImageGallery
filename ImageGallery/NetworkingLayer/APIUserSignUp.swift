//
//  APIUserSignUp.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class APIUserSignUp {
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = () -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
  private static let signUpEndpoint = "/create"
  
  private static let URLString: String = API.baseURL + APIUserSignUp.signUpEndpoint
  
  private static func parametersWith(username: String?, email: String?, password: String?) -> [String : Any] {
    let parameters: [String : Any] = [
      "username": username ?? "",
      "email": email ?? "",
      "password": password ?? ""
    ]
    return parameters
  }
  
  public static func requestWith(username: String,
                                 email: String?,
                                 password: String?,
                                 avatar: UIImage?,
                                 success: @escaping successAPIUserSignUpCompletionHandlerAPIUserLogIn,
                                 failure: @escaping errorAPIUserSignUpCompletionHandlerAPIUserLogIn) {
    let parameters = APIUserSignUp.parametersWith(username: username, email:email, password:password)
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(UIImagePNGRepresentation(avatar!)!, withName: "avatar", fileName: "avatar", mimeType: "image/png")
      for (key, value) in parameters {
        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
      }
    }, to:URLString)
    { (result) in
      switch result {
      case .success(let upload, _, _):
        
        upload.uploadProgress(closure: { (progress) in
          //Print progress
        })
        
        upload.responseJSON { response in
          let responseJSON = JSON(data: response.data!)
          print(responseJSON)
          if response.response?.statusCode == 201 {
            success()
          } else {
            
          }
        }
        
      case .failure( _): break
        //print encodingError.description
      }
    }
    
  }

}
