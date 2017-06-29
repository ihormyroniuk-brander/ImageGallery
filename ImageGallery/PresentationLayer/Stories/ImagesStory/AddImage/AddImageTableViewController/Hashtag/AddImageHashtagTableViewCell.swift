//
//  AddImageHashtagTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageHashtagTableViewCell: TextFieldTableViewCell {

  func set(hashtag: String?) {
    self.textField.text = hashtag
  }
  
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
  
  private func initializeTextField() {
    setupTextField()
  }
  
  private func setupTextField() {
    textField.backgroundColor = UIColor.red
    textField.keyboardType = .default
    textField.autocapitalizationType = .none
  }
  
}
