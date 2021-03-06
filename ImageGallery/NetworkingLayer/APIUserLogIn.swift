//
//  APILogIn.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIUserLogIn {
  
  // MARK: Input
  
  private static let logInEndpoint = "/login"
  
  private static let URLString: String = API.baseURL + APIUserLogIn.logInEndpoint
  
  private static func parametersWith(email: String?, password: String?) -> [String : Any] {
    let parameters: [String : Any] = [
      "email": email ?? "",
      "password": password ?? ""
    ]
    return parameters
  }
  
  // MARK: Execution
  
  public static func requestWith(email: String?,
                                 password: String?,
                                 success: successAPIUserLogInCompletionHandlerAPIUserLogIn?,
                                 failure: errorAPIUserLogInCompletionHandlerAPIUserLogIn?) {
    let parameters = APIUserLogIn.parametersWith(email:email, password:password)
    Alamofire.request(URLString, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
        let user = APIUserLogIn.userFrom(responseJSON: responseJSON)
        user.email = email
        success?(user)
      } else {
        let error = NSError()
        failure?(error)
      }
    }
  }
  
  // MARK: Output
  
  private static func userFrom(responseJSON: JSON) -> User {
    let user = User()
    user.token = responseJSON["token"].stringValue
    user.avatarURLString = responseJSON["avatar"].stringValue
    return user
  }
  
  typealias successAPIUserLogInCompletionHandlerAPIUserLogIn = (_ user: User) -> Void
  typealias errorAPIUserLogInCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
}
