//
//  AddImageHashtagTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageHashtagTableViewCellController: TextFieldTableViewCellController {

  // MARK: Data
  
  public var hashtag: String?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(AddImageHashtagTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(AddImageHashtagTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: AddImageHashtagTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(AddImageHashtagTableViewCell.self)) as! AddImageHashtagTableViewCell
    cell.set(hashtag: hashtag)
    cell.textField.addTarget(self, action: #selector(AddImageHashtagTableViewCellController.textFieldDidChange), for: .editingChanged)
    return cell
  }
  
  func textFieldDidChange(textField: UITextField) {
    self.hashtag = textField.text
  }
  
}
