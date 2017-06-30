//
//  GIFView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class GIFView: UIView {

  let GIFImageView = UIImageView()
  
  override func willMove(toWindow newWindow: UIWindow?) {
    placeGIFImageView()
    backgroundColor = UIColor.gray.withAlphaComponent(0.8)
    initializeEmailTextField()
    initializeLogInButton()
  }

  // MARK: Email TextField
  
  let weatherTextField = StandardTextField()
  
  private func initializeEmailTextField() {
    setupEmailTextField()
    placeEmailTextField()
  }
  
  private func setupEmailTextField() {
    weatherTextField.keyboardType = .default
    weatherTextField.placeholder = "Weather"
  }
  
  private func placeEmailTextField() {
    self.addSubview(weatherTextField)
    weatherTextField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(32)
      make.right.equalTo(-32)
      make.top.equalTo(66)
      make.height.equalTo(44)
    }
  }

  // MARK: LogIn Button
  
  let generateGifButton = StandardButton()
  
  private func initializeLogInButton() {
    setupLogInButton()
    placeLogInButton()
  }
  
  private func setupLogInButton() {
    generateGifButton.setTitle("Generate GIF", for: UIControlState.normal)
  }
  
  private func placeLogInButton() {
    self.addSubview(generateGifButton)
    generateGifButton.snp.makeConstraints { (make) -> Void in
      make.leading.equalTo(weatherTextField)
      make.trailing.equalTo(weatherTextField)
      make.height.equalTo(weatherTextField)
      make.top.equalTo(weatherTextField.snp.bottom).offset(16)
    }
  }
  
  func placeGIFImageView() {
    self.addSubview(GIFImageView)
    GIFImageView.contentMode = .scaleAspectFit
    GIFImageView.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(44)
      make.right.equalTo(-44)
      make.centerY.equalToSuperview()
      make.height.equalTo(168)
    }
  }
  
  func setupGIFImageView(URL: URL) {
    GIFImageView.contentMode = UIViewContentMode.scaleAspectFit
    let gif = UIImage.gif(url: URL.absoluteString)
    OperationQueue.main.addOperation {
      self.GIFImageView.image = gif
    }
  }
  
}
