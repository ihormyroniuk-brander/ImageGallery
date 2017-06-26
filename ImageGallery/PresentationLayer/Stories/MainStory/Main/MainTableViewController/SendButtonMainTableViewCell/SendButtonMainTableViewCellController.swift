//
//  SendButtonMainTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

protocol SendButtonMainTableViewCellControllerController {
  func sendButtonTouchUpInsideEventAction()
}

class SendButtonMainTableViewCellController: DefaultTableViewCellController {

  // MARK: Data
  
  public var avatarURL: URL?
  
  // MARK: Delegate
  
  public var delegate: SendButtonMainTableViewCellControllerController?
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SendButtonMainTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SendButtonMainTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SendButtonMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SendButtonMainTableViewCell.self)) as! SendButtonMainTableViewCell
    cell.sendButton.addTarget(self, action: #selector(sendButtonTouchUpInsideEventAction), for: .touchUpInside)
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

  func sendButtonTouchUpInsideEventAction(sender: UIButton!) {
    self.delegate?.sendButtonTouchUpInsideEventAction()
  }
  
}
