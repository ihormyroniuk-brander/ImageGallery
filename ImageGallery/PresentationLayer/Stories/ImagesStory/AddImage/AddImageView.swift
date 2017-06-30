//
//  AddImageView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageView: UIView {

  override func willMove(toWindow newWindow: UIWindow?) {
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }

  func place(addImageTableView: UITableView) {
    self.addSubview(addImageTableView)
    addImageTableView.snp.makeConstraints { (make) -> Void in
      make.left.top.right.bottom.equalTo(self)
    }
  }
  
}
