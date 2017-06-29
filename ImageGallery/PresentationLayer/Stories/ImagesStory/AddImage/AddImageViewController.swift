//
//  AddImageViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {

  let addImageTableViewController = AddImageTableViewController()
  private let customView = AddImageView()
  
  override func loadView() {
    self.view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

        // Do any additional setup after loading the view.
    setupView()
  }

  func setupView() {
    self.addChildViewController(addImageTableViewController)
    addImageTableViewController.willMove(toParentViewController: self)
    customView.place(addImageTableView: (addImageTableViewController.tableView)!)
    
    
    
    let button1 = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AddImageViewController.addImageBarButtonItemAction))
    self.navigationItem.rightBarButtonItem  = button1
  }
  
  // MARK: Actions
  
  func addImageBarButtonItemAction(sender: UIBarButtonItem) {
    let image = UIImage(named: "panda")//self.addImageTableViewController.imageAddImageTableViewCellController.image
    let description = self.addImageTableViewController.descriptionTableViewCellController.details
    let hashtag = self.addImageTableViewController.hashtagTableViewCellController.hashtag
    APIImagesAddImage.requestWith(token: Application.user?.token, image: image!, description: description, hashtag: hashtag, latitude: 49.9935, longitude: 36.2304, success: { (image) in
      self.navigationController?.popViewController(animated: true)
    }) { (error) in
      
    }
  }

}
