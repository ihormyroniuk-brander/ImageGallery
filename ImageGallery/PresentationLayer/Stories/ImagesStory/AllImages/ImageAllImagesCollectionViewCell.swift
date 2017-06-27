//
//  ImageAllImagesCollectionViewCell.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SDWebImage

class ImageAllImagesCollectionViewCell: UICollectionViewCell {
  
  // MARK: Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.yellow
    setupAvatarImageView()
    setupWeatherLabel()
    setupAddressLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Image ImageView
  
  let imageImageView = UIImageView()
  
  private func setupAvatarImageView() {
    placeImageImageView()
    imageImageView.contentMode = UIViewContentMode.scaleAspectFit
    imageImageView.isUserInteractionEnabled = true
  }
  
  private func placeImageImageView() {
    self.addSubview(imageImageView)
    imageImageView.snp.makeConstraints { (make) -> Void in
      //make.height.equalTo(144)
      make.left.equalToSuperview().offset(0)
      make.top.equalToSuperview().offset(0)
      make.right.equalToSuperview().offset(0)
      //make.bottom.equalTo().offset(-24)
    }
  }
  
  func set(imageURL: URL) {
    imageImageView.sd_setImage(with: imageURL,
                               placeholderImage: UIImage(named: "placeholder.png"))
  }
  
  // MARK: Weather Label
  
  let weatherLabel = UILabel()
  
  private func setupWeatherLabel() {
    placeWeatherLabel()
    weatherLabel.font = UIFont.systemFont(ofSize: 8)
  }
  
  private func placeWeatherLabel() {
    self.addSubview(weatherLabel)
    weatherLabel.snp.makeConstraints { (make) -> Void in
      //make.height.equalTo(144)
      make.left.equalToSuperview().offset(0)
      make.top.equalTo(imageImageView.snp.bottom)
      make.right.equalToSuperview().offset(0)
    }
  }
  
  func set(weatherText: String?) {
    weatherLabel.text = weatherText
  }
  
  // MARK: Address Label
  
  let addressLabel = UILabel()
  
  private func setupAddressLabel() {
    placeAddressLabel()
    addressLabel.font = UIFont.systemFont(ofSize: 8)
  }
  
  private func placeAddressLabel() {
    self.addSubview(addressLabel)
    addressLabel.snp.makeConstraints { (make) -> Void in
      //make.height.equalTo(144)
      make.left.equalToSuperview().offset(0)
      make.top.equalTo(weatherLabel.snp.bottom)
      make.right.equalToSuperview().offset(0)
      make.bottom.equalToSuperview()
    }
  }
  
  func set(addressText: String?) {
    addressLabel.text = addressText
  }
  
}
