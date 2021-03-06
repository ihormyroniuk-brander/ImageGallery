//
//  LogInViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SVProgressHUD

class LogInViewController: UIViewController {

  // MARK: View
  
  private let customView = LogInView()
  
  override func loadView() {
    self.view = customView
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    customView.logInButton.addTarget(self, action: #selector(logInButtonTouchUpInsideEventAction), for: .touchUpInside)
    customView.signUpButton.addTarget(self, action: #selector(signUpButtonTouchUpInsideEventAction), for: .touchUpInside)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    /*let email = "k@k.k"
    let password = "k"
    APIUserLogIn.requestWith(email: email, password: password, success: { (user) in
      Application.user = user
      self.navigationController?.pushViewController(MainViewController(), animated: true)
    }) { (error) in
      
    }*/
    self.navigationItem.title = "Log In"
  }
  
  // MARK: Actions

  func logInButtonTouchUpInsideEventAction(sender: UIButton!) {
    let email = self.customView.emailTextField.text
    let password = self.customView.passwordTextField.text
    SVProgressHUD.show()
    APIUserLogIn.requestWith(email: email, password: password, success: { (user) in
      SVProgressHUD.dismiss()
      Application.user = user
      self.navigationController?.pushViewController(MainViewController(), animated: true)
    }) { (error) in
      SVProgressHUD.dismiss()
      APIErrorAlertController.show(error: error, in: self, animated: true)
    }
  }
  
  func signUpButtonTouchUpInsideEventAction(sender: UIButton!) {
    let navigationController = UINavigationController(rootViewController: SignUpViewController())
    present(navigationController, animated: true, completion: nil)
  }
  
}
