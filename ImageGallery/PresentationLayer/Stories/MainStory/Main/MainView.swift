//
//  MainView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

  override func willMove(toWindow newWindow: UIWindow?) {
    self.backgroundColor = UIColor.green
  }

  override func willMove(toSuperview newSuperview: UIView?) {
    
  }
  
  func place(mainTableView: UITableView) {
    self.addSubview(mainTableView)
    mainTableView.snp.makeConstraints { (make) -> Void in
      make.left.top.right.bottom.equalTo(self)
    }
  }
  
}
