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
    
    let button1 = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SignUpViewController.closeBarButtonItemAction))
    self.navigationItem.leftBarButtonItem = button1
    let button2 = UIBarButtonItem(title: "Sign Up", style: .plain, target: self, action: #selector(SignUpViewController.signUpBarButtonItemAction))
    self.navigationItem.rightBarButtonItem = button2
    
    setupView()
  }
  
  var signUpTableController = SignUpTableController()

  func setupView() {
    self.addChildViewController(signUpTableController)
    signUpTableController.willMove(toParentViewController: self)
    customView.place(signUpTableView: (signUpTableController.tableView)!)
  }
  
  func closeBarButtonItemAction(sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  func signUpBarButtonItemAction(sender: UIBarButtonItem) {
    let avatar = signUpTableController.avatarTableViewCellController.avatar
    let username = signUpTableController.usernameTableViewCellController.username
    let email = signUpTableController.emailTableViewCellController.email
    let password = signUpTableController.passwordTableViewCellController.password
    
    APIUserSignUp.requestWith(username: username!, email: email, password: password, avatar: avatar, success: {
      self.dismiss(animated: true, completion: nil)
    }) { (error) in
      
    }
  }
  
}
