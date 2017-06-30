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
    placeGIFImageView()
  }

  func placeGIFImageView() {
    self.addSubview(GIFImageView)
    GIFImageView.contentMode = .scaleAspectFit
    GIFImageView.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(44)
      make.right.equalTo(-44)
      make.centerY.equalToSuperview()
      make.height.equalTo(168)
    }
  }
  
  func setupGIFImageView(URL: URL) {
    GIFImageView.contentMode = UIViewContentMode.scaleAspectFit
    let gif = UIImage.gif(url: URL.absoluteString)
    OperationQueue.main.addOperation {
      self.GIFImageView.image = gif
    }
  }
  
}
