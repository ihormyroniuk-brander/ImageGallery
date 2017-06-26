//
//  AvatarMainTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AvatarMainTableViewCellController: DefaultTableViewCellController {

  // MARK: Data
  
  public var avatarURL: URL?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(AvatarMainTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(AvatarMainTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: AvatarMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(AvatarMainTableViewCell.self)) as! AvatarMainTableViewCell
    cell.set(avatarURL: avatarURL!)
    return cell
  }
  
  override var shouldHighlight: Bool {
    return true
  }
  
  override var estimatedHeight: CGFloat {
    return 318
  }
  
  override var height: CGFloat {
    return UITableViewAutomaticDimension
  }

  
}
