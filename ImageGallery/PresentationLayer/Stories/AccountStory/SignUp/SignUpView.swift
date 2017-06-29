//
//  SignUpView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpView: UIView {

  override func willMove(toWindow newWindow: UIWindow?) {
    self.backgroundColor = UIColor.green
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }
  
  func place(signUpTableView: UITableView) {
    self.addSubview(signUpTableView)
    signUpTableView.snp.makeConstraints { (make) -> Void in
      make.left.top.right.bottom.equalTo(self)
    }
  }

}
