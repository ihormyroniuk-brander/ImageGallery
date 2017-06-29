//
//  SignUpUsernameTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpUsernameTableViewCellController: TextFieldTableViewCellController, UITextFieldDelegate {

  // MARK: Data
  
  public var username: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SignUpUsernameTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SignUpUsernameTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SignUpUsernameTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SignUpUsernameTableViewCell.self)) as! SignUpUsernameTableViewCell
    cell.set(username: username)
    cell.textField.addTarget(self, action: #selector(SignUpUsernameTableViewCellController.textFieldDidChange), for: .editingChanged)
    return cell
  }
  
  func textFieldDidChange(textField: UITextField) {
    self.username = textField.text
  }
  
}
