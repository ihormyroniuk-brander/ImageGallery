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
    self.backgroundColor = UIColor.yellow
    initializeEmailTextField()
    initializePasswordTextField()
    initializeLogInButton()
    initializeSignUpButton()
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
    
  }
  
  // MARK: Email TextField
  
  let emailTextField = UITextField()
  
  private func initializeEmailTextField() {
    setupEmailTextField()
    placeEmailTextField()
  }
  
  private func setupEmailTextField() {
    emailTextField.backgroundColor = UIColor.red
    emailTextField.keyboardType = .emailAddress
    emailTextField.autocapitalizationType = .none
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
  
  let passwordTextField = UITextField()
  
  private func initializePasswordTextField() {
    setupPasswordTextField()
    placePasswordTextField()
  }
  
  private func setupPasswordTextField() {
    passwordTextField.backgroundColor = UIColor.green
    passwordTextField.isSecureTextEntry = true
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
  
  let logInButton = UIButton()
  
  private func initializeLogInButton() {
    setupLogInButton()
    placeLogInButton()
  }
  
  private func setupLogInButton() {
    logInButton.setTitle("Log In", for: UIControlState.normal)
    logInButton.backgroundColor = UIColor.green
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
  
  let signUpButton = UIButton()
  
  private func initializeSignUpButton() {
    setupSignUpButton()
    placeSignUpButton()
  }
  
  private func setupSignUpButton() {
    signUpButton.setTitle("Sign Up", for: UIControlState.normal)
    signUpButton.backgroundColor = UIColor.green
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
