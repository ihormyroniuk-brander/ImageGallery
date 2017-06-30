//
//  LogInView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SnapKit

class LogInView: UIView {

  override func willMove(toWindow newWindow: UIWindow?) {
    backgroundColor = UIColor.white
    initializeEmailTextField()
    initializePasswordTextField()
    initializeLogInButton()
    initializeSignUpButton()
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }
  
  // MARK: Email TextField
  
  let emailTextField = StandardTextField()
  
  private func initializeEmailTextField() {
    setupEmailTextField()
    placeEmailTextField()
  }
  
  private func setupEmailTextField() {
    emailTextField.keyboardType = .emailAddress
    emailTextField.autocapitalizationType = .none
    emailTextField.placeholder = "Email"
  }
  
  private func placeEmailTextField() {
    self.addSubview(emailTextField)
    emailTextField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(32)
      make.right.equalTo(-32)
      make.top.equalTo(96)
      make.height.equalTo(44)
    }
  }
  
  // MARK: Password TextField
  
  let passwordTextField = StandardTextField()
  
  private func initializePasswordTextField() {
    setupPasswordTextField()
    placePasswordTextField()
  }
  
  private func setupPasswordTextField() {
    passwordTextField.isSecureTextEntry = true
    passwordTextField.placeholder = "Password"
  }
  
  private func placePasswordTextField() {
    self.addSubview(passwordTextField)
    passwordTextField.snp.makeConstraints { (make) -> Void in
      make.leading.equalTo(emailTextField)
      make.trailing.equalTo(emailTextField)
      make.height.equalTo(emailTextField)
      make.top.equalTo(emailTextField.snp.bottom).offset(16)
    }
  }
  
  // MARK: LogIn Button
  
  let logInButton = StandardButton()
  
  private func initializeLogInButton() {
    setupLogInButton()
    placeLogInButton()
  }
  
  private func setupLogInButton() {
    logInButton.setTitle("Log In", for: UIControlState.normal)
  }
  
  private func placeLogInButton() {
    self.addSubview(logInButton)
    logInButton.snp.makeConstraints { (make) -> Void in
      make.leading.equalTo(passwordTextField)
      make.trailing.equalTo(passwordTextField)
      make.height.equalTo(passwordTextField)
      make.top.equalTo(passwordTextField.snp.bottom).offset(16)
    }
  }
  
  // MARK: SignUp Button
  
  let signUpButton = StandardButton()
  
  private func initializeSignUpButton() {
    setupSignUpButton()
    placeSignUpButton()
  }
  
  private func setupSignUpButton() {
    signUpButton.setTitle("Sign Up", for: UIControlState.normal)
  }
  
  private func placeSignUpButton() {
    self.addSubview(signUpButton)
    signUpButton.snp.makeConstraints { (make) -> Void in
      make.leading.equalTo(logInButton)
      make.trailing.equalTo(logInButton)
      make.height.equalTo(logInButton)
      make.top.equalTo(logInButton.snp.bottom).offset(16)
    }
  }

  
}
