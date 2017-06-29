//
//  SignUpViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  private let customView = SignUpView()
  
  override func loadView() {
    self.view = customView
  }

}
