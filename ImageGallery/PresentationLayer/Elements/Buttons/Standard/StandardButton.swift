//
//  StandardButton.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/30/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class StandardButton: UIButton {

  required init(value: Int = 0) {
    super.init(frame: .zero)
    
    setTitleColor(UIColor.black, for: .normal)
    layer.borderWidth = 1
    layer.borderColor = UIColor.black.cgColor
    layer.cornerRadius = 12
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
