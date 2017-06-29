//
//  SignUpPasswwordTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpPasswordTableViewCellController: TextFieldTableViewCellController {

  // MARK: Data
  
  public var password: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SignUpPasswordTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SignUpPasswordTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SignUpPasswordTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SignUpPasswordTableViewCell.self)) as! SignUpPasswordTableViewCell
    cell.set(password: password)
    return cell
  }
  
}
