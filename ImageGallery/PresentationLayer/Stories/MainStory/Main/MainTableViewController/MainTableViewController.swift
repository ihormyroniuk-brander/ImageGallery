//
//  MainViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainTableViewController: DefaultTableViewController, SendButtonMainTableViewCellControllerController {

  override func loadView() {
    super.loadView()
    
    self.tableView = MainTableView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    registerTableView()
    prepareTableViewDataSource()
    self.tableView.reloadData()
  }
  
  // MARK: UITableView
  
  func registerTableView() {
    AvatarMainTableViewCellController.register(in: (tableView)!)
    MainEmailTextFieldTableViewCellController.register(in: (tableView)!)
    SendButtonMainTableViewCellController.register(in: (tableView)!)
  }
  
  func prepareTableViewDataSource() {
    sectionsControllers = []
    
    let sectionController = DefaultTableViewSectionController()
    
    let avatarMainTableViewCellController = AvatarMainTableViewCellController()
    avatarMainTableViewCellController.avatarURL = URL(string: (Application.user?.avatarURLString)!)
    sectionController.cellsControllers.append(avatarMainTableViewCellController)
    
    let emailMainTableViewCellController = MainEmailTextFieldTableViewCellController()
    emailMainTableViewCellController.email = (Application.user?.email)!
    sectionController.cellsControllers.append(emailMainTableViewCellController)
    
    let sendButtonMainTableViewCellController = SendButtonMainTableViewCellController()
    sendButtonMainTableViewCellController.delegate = self
    sectionController.cellsControllers.append(sendButtonMainTableViewCellController)
    
    sectionsControllers.append(sectionController)
  }
  
  
  func sendButtonTouchUpInsideEventAction() {
    navigationController?.pushViewController(AllImagesViewController(), animated: true)
  }
}
