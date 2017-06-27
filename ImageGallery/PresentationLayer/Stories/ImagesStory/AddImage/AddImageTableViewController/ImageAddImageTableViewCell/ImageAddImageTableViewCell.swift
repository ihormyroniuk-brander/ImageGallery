//
//  ImageAddImageTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class ImageAddImageTableViewCell: UITableViewCell {

  var imageImageView = UIImageView()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.setupAvatarImageView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func setupAvatarImageView() {
    self.addSubview(imageImageView)
    imageImageView.snp.makeConstraints { (make) -> Void in
      make.width.equalTo(168)
      make.height.equalTo(168)
      make.top.equalToSuperview().offset(100)
      make.bottom.equalToSuperview().offset(-50)
      make.centerX.equalToSuperview()
    }
    
    imageImageView.isUserInteractionEnabled = true
  }
}
