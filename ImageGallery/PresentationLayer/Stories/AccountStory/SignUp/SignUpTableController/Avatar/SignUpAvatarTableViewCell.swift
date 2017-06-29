//
//  SignUpAvatarTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpAvatarTableViewCell: UITableViewCell {

  var avatarImageView = UIImageView()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.setupAvatarImageView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupAvatarImageView() {
    avatarImageView = UIImageView()
    avatarImageView.contentMode = UIViewContentMode.scaleAspectFit
    avatarImageView.isUserInteractionEnabled = true
    self.addSubview(avatarImageView)
    avatarImageView.snp.makeConstraints { (make) -> Void in
      make.width.equalTo(168)
      make.height.equalTo(168)
      make.top.equalToSuperview().offset(100)
      make.bottom.equalToSuperview().offset(-50)
      make.centerX.equalToSuperview()
    }
    
  }
  
  public func set(avatar: UIImage?) {
    if avatar != nil {
      avatarImageView.image = avatar
    } else {
      
    }
  }

}
