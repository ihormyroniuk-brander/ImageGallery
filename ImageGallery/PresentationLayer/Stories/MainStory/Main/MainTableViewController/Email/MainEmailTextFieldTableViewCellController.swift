//
//  MainEmailTextFieldTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainEmailTextFieldTableViewCellController: TextFieldTableViewCellController {

  // MARK: Data
  
  public var email: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(MainEmailTextFieldTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(MainEmailTextFieldTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: MainEmailTextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MainEmailTextFieldTableViewCell.self)) as! MainEmailTextFieldTableViewCell
    cell.set(email: email)
    return cell
  }
  
}
