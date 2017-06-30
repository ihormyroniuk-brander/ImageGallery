//
//  SignUpView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpView: SetupView {
  
  // MARK: Life Cycle

  override func willMove(toWindow newWindow: UIWindow?) {
    self.backgroundColor = UIColor.green
  }

  // MARK: Elements
  
  var closeBarButtonItem = UIBarButtonItem()
  var signUpBarButtonItem = UIBarButtonItem()
  
  // MARK: Setup
  
  override func setup() {
    setupCloseBarButtonItem()
    placeCloseBarButtonItem()
    setupSignUpBarButtonItem()
    placeSignUpBarButtonItem()
    setText()
  }
  
  // MARK: Close BarButtonItem
  
  func setupCloseBarButtonItem() {
    closeBarButtonItem.style = .plain
  }
  
  func placeCloseBarButtonItem() {
    navigationItem?.leftBarButtonItem = closeBarButtonItem
  }
  
  // MARK: SignUp BarButtonItem
  
  func setupSignUpBarButtonItem() {
    signUpBarButtonItem.style = .plain
  }
  
  func placeSignUpBarButtonItem() {
    navigationItem?.rightBarButtonItem = signUpBarButtonItem
  }
  
  // MARK: SignUp TableView
  
  func setup(signUpTableView: SignUpTableView) {
    
  }
  
  func place(signUpTableView: SignUpTableView) {
    self.addSubview(signUpTableView)
    signUpTableView.snp.makeConstraints { (make) -> Void in
      make.left.top.right.bottom.equalTo(self)
    }
  }
  
  // MARK: Text
  
  func setText() {
    closeBarButtonItem.title = "Close"
    signUpBarButtonItem.title = "Sign Up"
    navigationItem?.title = "Sign Up"
  }
  
}
