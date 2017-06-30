//
//  GIFViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SVProgressHUD

class GIFViewController: UIViewController {

  let customView = GIFView()
  
  override func loadView() {
    self.view = customView
    
    customView.generateGifButton.addTarget(self, action: #selector(logInButtonTouchUpInsideEventAction), for: .touchUpInside)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    /*APIGIFsGenerateGIF.requestWith(token: Application.user?.token, weather: "Clouds", success: { (URL) in
      self.customView.setupGIFImageView(URL: URL)
    }) { (error) in
      APIErrorAlertController.show(error: error, in: self, animated: true)
    }*/
    
    
    let imageImageViewTapGestureRecognizer = UITapGestureRecognizer()
    imageImageViewTapGestureRecognizer.addTarget(self, action: #selector(imageImageViewTapGestureRecognizerAction(tapGestureRecognizer:)))
    customView.addGestureRecognizer(imageImageViewTapGestureRecognizer)
  }
  
  func imageImageViewTapGestureRecognizerAction(tapGestureRecognizer: UITapGestureRecognizer) {
    dismiss(animated: false, completion: nil)
  }

  // MARK: Actions
  
  func logInButtonTouchUpInsideEventAction(sender: UIButton!) {
    let weather = self.customView.weatherTextField.text
    SVProgressHUD.show()
    APIGIFsGenerateGIF.requestWith(token: Application.user?.token, weather: weather, success: { (URL) in
      SVProgressHUD.dismiss()
      self.customView.setupGIFImageView(URL: URL)
    }) { (error) in
      SVProgressHUD.dismiss()
      APIErrorAlertController.show(error: error, in: self, animated: true)
    }
  }
  
}
