//
//  AddImageDescriptionTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageDescriptionTableViewCellController: TextFieldTableViewCellController {

  // MARK: Data
  
  public var details: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(AddImageDescriptionTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(AddImageDescriptionTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: AddImageDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(AddImageDescriptionTableViewCell.self)) as! AddImageDescriptionTableViewCell
    cell.set(details: details)
    cell.textField.addTarget(self, action: #selector(AddImageDescriptionTableViewCellController.textFieldDidChange), for: .editingChanged)
    return cell
  }
  
  func textFieldDidChange(textField: UITextField) {
    self.details = textField.text
  }
  
}
