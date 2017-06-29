//
//  APIUserSignUp.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import Alamofire

class APIUserSignUp {
  
  // MARK: Input
  
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
  
  // MARK: Execution
  
  public static func requestWith(username: String,
                                 email: String?,
                                 password: String?,
                                 avatar: UIImage?,
                                 success: successAPIUserSignUpCompletionHandlerAPIUserLogIn?,
                                 failure: errorAPIUserSignUpCompletionHandlerAPIUserLogIn?) {
    let parameters = APIUserSignUp.parametersWith(username: username, email:email, password:password)
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(UIImagePNGRepresentation(avatar!)!, withName: "avatar", fileName: "avatar", mimeType: "image/png")
      for (key, value) in parameters {
        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
      }
    }, to: URLString)
    { (result) in
      switch result {
      case .success(let upload, _, _):
        upload.responseJSON { response in
          if response.response?.statusCode == 201 {
            success?()
          } else {
            let error = NSError()
            failure?(error)
          }
        }
      case .failure(let error):
        failure?(error)
      }
    }
    
  }
  
  // MARK: Output
  
  typealias successAPIUserSignUpCompletionHandlerAPIUserLogIn = () -> Void
  typealias errorAPIUserSignUpCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void

}
