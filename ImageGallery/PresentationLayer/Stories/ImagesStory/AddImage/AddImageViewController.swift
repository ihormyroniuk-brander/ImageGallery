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
    
    
    
    let button1 = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AddImageViewController.sayHello))
    self.navigationItem.rightBarButtonItems  = [button1]
  }
  
  func sayHello(sender: UIBarButtonItem) {
    APIImagesAddImage.requestWith(token: Application.user?.token,
                                  image: self.addImageTableViewController.imageAddImageTableViewCellController.image!,
                                  description: "123456789",
                                  hashtag: "123456789",
                                  latitude: 49.9935,
                                  longitude: 36.2304)
  }

}
