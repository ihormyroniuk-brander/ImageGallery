//
//  SignUpAvatarTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpAvatarTableViewCellController: DefaultTableViewCellController {

  // MARK: Data
  
  public var avatar: UIImage?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SignUpAvatarTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SignUpAvatarTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SignUpAvatarTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SignUpAvatarTableViewCell.self)) as! SignUpAvatarTableViewCell
    cell.set(avatar: avatar)
    return cell
  }
  
  override var estimatedHeight: CGFloat {
    return 318
  }
  
  override var height: CGFloat {
    return UITableViewAutomaticDimension
  }
  
}
