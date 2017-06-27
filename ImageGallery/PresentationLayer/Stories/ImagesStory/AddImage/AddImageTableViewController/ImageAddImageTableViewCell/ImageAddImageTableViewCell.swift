//
//  ImageAddImageTableViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class ImageAddImageTableViewCell: UITableViewCell {

  // MARK: Initializers
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.setupAvatarImageView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: UIImagePickerController
  
  let imageImageView = UIImageView()
  
  private func setupAvatarImageView() {
    placeImageImageView()
    imageImageView.contentMode = UIViewContentMode.scaleAspectFit
    imageImageView.isUserInteractionEnabled = true
  }
  
  private func placeImageImageView() {
    self.addSubview(imageImageView)
    imageImageView.snp.makeConstraints { (make) -> Void in
      make.height.equalTo(144)
      make.left.equalToSuperview().offset(24)
      make.top.equalToSuperview().offset(24)
      make.right.equalToSuperview().offset(-24)
      make.bottom.equalToSuperview().offset(-24)
    }
  }
  
  func set(image: UIImage?) {
    if image != nil {
      imageImageView.image = image;
    } else {
      imageImageView.image = UIImage(named: "photo")!;
    }
  }
  
}
