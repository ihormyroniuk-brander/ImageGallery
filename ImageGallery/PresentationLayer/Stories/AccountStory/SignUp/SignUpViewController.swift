//
//  SignUpViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  // MARK: View
  
  private let customView = SignUpView()
  
  override func loadView() {
    self.view = customView
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  var signUpTableController = SignUpTableController()

  func setupView() {
    self.addChildViewController(signUpTableController)
    signUpTableController.willMove(toParentViewController: self)
    customView.place(signUpTableView: (signUpTableController.tableView)!)
  }
  
}
