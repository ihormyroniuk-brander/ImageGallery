//
//  TextFieldTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.backgroundColor = UIColor.white
    initializeTextField()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // MARK: TextField
  
  var textField: UITextField = UITextField()
  
  private func initializeTextField() {
    setupTextField()
    placeTextField()
  }
  
  private func setupTextField() {
    textField.backgroundColor = UIColor.red
    textField.keyboardType = .emailAddress
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
  }
  
  private func placeTextField() {
    self.addSubview(textField)
    textField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(32)
      make.right.equalTo(-32)
      make.top.equalTo(12)
      make.height.equalTo(44)
      make.bottom.equalTo(-12)
    }
  }
  
}
