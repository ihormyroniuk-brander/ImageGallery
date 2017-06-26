//
//  SendButtonMainTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SendButtonMainTableViewCell: UITableViewCell {

  var sendButton: UIButton = UIButton()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.setupAvatarImageView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupAvatarImageView() {
    sendButton.backgroundColor = UIColor.blue
    sendButton.setTitle("SEND", for: UIControlState.normal)
    
    self.addSubview(sendButton)
    sendButton.snp.makeConstraints { (make) -> Void in
      make.height.equalTo(32)
      make.left.equalToSuperview().offset(32)
      make.top.equalToSuperview().offset(16)
      make.right.equalToSuperview().offset(-32)
      make.bottom.equalToSuperview().offset(-16)
    }
    
  }
  
}
