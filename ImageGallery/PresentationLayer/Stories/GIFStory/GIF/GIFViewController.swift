//
//  GIFViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class GIFViewController: UIViewController {

  let customView = GIFView()
  
  override func loadView() {
    self.view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    APIImagesGenerateGIF.requestWith(token: Application.user?.token, weather: "Clouds", success: { (URL) in
      self.customView.setupGIFImageView(URL: URL)
    }) { (error) in
      
    }
    
    let imageImageViewTapGestureRecognizer = UITapGestureRecognizer()
    imageImageViewTapGestureRecognizer.addTarget(self, action: #selector(imageImageViewTapGestureRecognizerAction(tapGestureRecognizer:)))
    customView.addGestureRecognizer(imageImageViewTapGestureRecognizer)
  }
  
  func imageImageViewTapGestureRecognizerAction(tapGestureRecognizer: UITapGestureRecognizer) {
    dismiss(animated: false, completion: nil)
  }

}
