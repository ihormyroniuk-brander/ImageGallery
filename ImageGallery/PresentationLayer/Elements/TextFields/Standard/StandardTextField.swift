//
//  StandardTextField.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/30/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class StandardTextField: UITextField {

  required init(value: Int = 0) {
    super.init(frame: .zero)
    
    backgroundColor = UIColor.lightGray
    keyboardType = .emailAddress
    autocapitalizationType = .none
    autocorrectionType = .no
    layer.borderColor = UIColor.darkGray.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 8
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
