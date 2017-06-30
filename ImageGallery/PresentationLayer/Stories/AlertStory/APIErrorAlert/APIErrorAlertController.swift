//
//  APIErrorAlertController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class APIErrorAlertController: UIAlertController {

  static func show(error: Error, in viewController: UIViewController, animated: Bool) {
    let alertController = UIAlertController(title: "Error", message: "Some error", preferredStyle: .alert)
    
    let OKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(OKAction)
    
    viewController.present(alertController, animated: animated, completion: nil)
  }

}
