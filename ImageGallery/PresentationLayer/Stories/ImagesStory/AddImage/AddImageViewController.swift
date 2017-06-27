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
  }

}
