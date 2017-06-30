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
  
  // MARK: Elements
  
  var signUpTableController = SignUpTableController()
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.addChildViewController(signUpTableController)
    signUpTableController.willMove(toParentViewController: self)
    
    setupView()
    customView.closeBarButtonItem.target = self
    customView.closeBarButtonItem.action = #selector(self.closeBarButtonItemAction)
    customView.signUpBarButtonItem.target = self
    customView.signUpBarButtonItem.action = #selector(self.signUpBarButtonItemAction)
  }

  func setupView() {
    customView.navigationItem = navigationItem
    customView.place(signUpTableView: (signUpTableController.tableView)! as! SignUpTableView)
    customView.setup()
  }
  
  // MARK: Actions
  
  func closeBarButtonItemAction(sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  func signUpBarButtonItemAction(sender: UIBarButtonItem) {
    let avatar = signUpTableController.avatarTableViewCellController.avatar
    let username = signUpTableController.usernameTableViewCellController.username
    let email = signUpTableController.emailTableViewCellController.email
    let password = signUpTableController.passwordTableViewCellController.password
    APIUserSignUp.requestWith(username: username, email: email, password: password, avatar: avatar, success: {
      self.dismiss(animated: true, completion: nil)
    }) { (error) in
      let alertController = UIAlertController(title: "Default Style", message: "A standard alert.", preferredStyle: .alert)

      let OKAction = UIAlertAction(title: "dfdf", style: .default, handler: nil)
      alertController.addAction(OKAction)
      
      let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
      alertController.addAction(cancelAction)
      
      self.present(alertController, animated: true, completion: nil)
    }
  }
  
}
