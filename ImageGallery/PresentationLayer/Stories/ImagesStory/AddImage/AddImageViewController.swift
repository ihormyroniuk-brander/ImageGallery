//
//  AddImageViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SVProgressHUD

class AddImageViewController: UIViewController {

  let addImageTableViewController = AddImageTableViewController()
  private let customView = AddImageView()
  
  override func loadView() {
    self.view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupView()
  }

  func setupView() {
    self.addChildViewController(addImageTableViewController)
    addImageTableViewController.willMove(toParentViewController: self)
    customView.place(addImageTableView: (addImageTableViewController.tableView)!)
    
    
    
    let button1 = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AddImageViewController.addImageBarButtonItemAction))
    self.navigationItem.rightBarButtonItem  = button1
    self.navigationItem.title = "Add image"
  }
  
  // MARK: Actions
  
  func addImageBarButtonItemAction(sender: UIBarButtonItem) {
    let image = self.addImageTableViewController.imageAddImageTableViewCellController.image
    let description = self.addImageTableViewController.descriptionTableViewCellController.details
    let hashtag = self.addImageTableViewController.hashtagTableViewCellController.hashtag
    SVProgressHUD.show()
    APIImagesAddImage.requestWith(token: Application.user?.token, image: image!, description: description, hashtag: hashtag, latitude: 49.9935, longitude: 36.2304, success: { (image) in
      SVProgressHUD.dismiss()
      self.navigationController?.popViewController(animated: true)
    }) { (error) in
      SVProgressHUD.dismiss()
      APIErrorAlertController.show(error: error, in: self, animated: true)
    }
  }

}
