//
//  AllImagesView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AllImagesView: UIView {

  override func willMove(toWindow newWindow: UIWindow?) {
    self.backgroundColor = UIColor.yellow
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }
  
  func place(allImagesCollectionView: UICollectionView) {
    self.addSubview(allImagesCollectionView)
    allImagesCollectionView.snp.makeConstraints { (make) -> Void in
      make.left.top.right.bottom.equalTo(self)
      make.top.equalTo(90)
    }
  }
  
}
