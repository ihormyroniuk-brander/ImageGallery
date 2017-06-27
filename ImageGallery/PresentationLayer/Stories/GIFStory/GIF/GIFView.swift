//
//  GIFView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class GIFView: UIView {

  let GIFImageView = UIImageView()
  
  override func willMove(toWindow newWindow: UIWindow?) {
    self.backgroundColor = UIColor.orange
    placeGIFImageView()
    setupGIFImageView()
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }

  func placeGIFImageView() {
    self.addSubview(GIFImageView)
    GIFImageView.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(44)
      make.right.equalTo(-44)
      make.centerY.equalToSuperview()
      make.height.equalTo(168)
    }
  }
  
  func setupGIFImageView() {
    GIFImageView.contentMode = UIViewContentMode.scaleAspectFit
    let gif = UIImage.gif(url: "http://api.doitserver.in.ua/upload/images/gif/95f711e43a451e7b86508df593a2f7f6.gif")
    OperationQueue.main.addOperation {
      self.GIFImageView.image = gif
    }
  }
  
}
