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
    initializeLabel()
    initializeTextField()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  // MARK: Label
  
  var label: UILabel = UILabel()
  
  private func initializeLabel() {
    setupLabel()
    placeLabel()
  }
  
  private func setupLabel() {
    label.font = UIFont.systemFont(ofSize: 10);
    label.textColor = UIColor.black
  }
  
  private func placeLabel() {
    self.addSubview(label)
    label.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(32)
      make.right.equalTo(-32)
      make.top.equalTo(8)
    }
  }
  
  // MARK: TextField
  
  var textField: UITextField = StandardTextField()
  
  private func initializeTextField() {
    setupTextField()
    placeTextField()
  }
  
  private func setupTextField() {
    
  }
  
  private func placeTextField() {
    self.addSubview(textField)
    textField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(32)
      make.right.equalTo(-32)
      make.top.equalTo(label.snp.bottom)
      make.height.equalTo(44)
      make.bottom.equalTo(-8)
    }
  }
  
}
