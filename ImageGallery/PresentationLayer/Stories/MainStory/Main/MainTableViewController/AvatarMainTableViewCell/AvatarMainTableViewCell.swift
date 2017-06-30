//
//  AvatarMainTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class AvatarMainTableViewCell: UITableViewCell {

  var avatarImageView: UIImageView?
  
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
    avatarImageView?.contentMode = .scaleAspectFit
    self.addSubview(avatarImageView!)
    avatarImageView?.snp.makeConstraints { (make) -> Void in
      make.width.equalTo(168)
      make.height.equalTo(168)
      make.top.equalToSuperview().offset(16)
      make.bottom.equalToSuperview().offset(-16)
      make.centerX.equalToSuperview()
    }
    
  }
  
  public func set(avatarURL: URL) {
    avatarImageView?.sd_setImage(with: avatarURL, placeholderImage: UIImage(named: "avatar_placeholder"))
  }
  
}
