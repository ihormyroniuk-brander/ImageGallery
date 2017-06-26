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
  
  typealias successAPIUserLogInCompletionHandlerAPIUserLogIn = (_ token: String, _ avatarURL: URL, _ signUpDate: Date) -> Void
  typealias errorAPIUserLogInCompletionHandlerAPIUserLogIn = (_ error: Error) -> Void
  
  private static let logInEndpoint = "/login"
  
  private static let URLString: String = API.baseURL + APIUserLogIn.logInEndpoint
  
  private static func parametersWith(email: String?, password: String?) -> [String : Any] {
    let parameters: [String : Any] = [
      "email": email ?? "",
      "password": password ?? ""
    ]
    return parameters
  }
  
  public static func requestWith(email: String?,
                                 password: String?,
                                 success: @escaping successAPIUserLogInCompletionHandlerAPIUserLogIn,
                                 failure: @escaping errorAPIUserLogInCompletionHandlerAPIUserLogIn) {
    let parameters = APIUserLogIn.parametersWith(email:email, password:password)
    Alamofire.request(URLString, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
      if response.response?.statusCode == 200 {
        let responseJSON = JSON(data: response.data!)
        let token = APIUserLogIn.tokenFrom(responseJSON: responseJSON)
        let avatarURL = APIUserLogIn.avatarURLStringFrom(responseJSON: responseJSON)
        let signUpDate = APIUserLogIn.signUpDateFrom(responseJSON: responseJSON)
        success(token, avatarURL, signUpDate)
      } else {
        
      }
    }
  }
  
  private static func tokenFrom(responseJSON: JSON) -> String {
    return responseJSON["token"].stringValue
  }
  
  private static func avatarURLStringFrom(responseJSON: JSON) -> URL {
    return URL(string: responseJSON["avatar"].stringValue)!
  }
  
  private static func signUpDateFrom(responseJSON: JSON) -> Date {
    return Date()
  }
  
}
