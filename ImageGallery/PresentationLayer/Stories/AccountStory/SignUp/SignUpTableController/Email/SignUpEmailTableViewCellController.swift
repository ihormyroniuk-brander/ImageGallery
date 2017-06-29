//
//  SignUpEmailTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpEmailTableViewCellController: TextFieldTableViewCellController {

  // MARK: Data
  
  public var email: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SignUpEmailTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SignUpEmailTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SignUpEmailTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SignUpEmailTableViewCell.self)) as! SignUpEmailTableViewCell
    cell.set(email: email)
    return cell
  }
  
}
