//
//  SignUpTableController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpTableController: DefaultTableViewController {
  
  // MARK: View
  
  override func loadView() {
    super.loadView()
    
    self.tableView = SignUpTableView()
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerTableView()
    prepareTableViewDataSource()
    self.tableView.reloadData()
  }
  
  // MARK: UITableView
  
  func registerTableView() {
    SignUpAvatarTableViewCellController.register(in: (tableView)!)
    SignUpUsernameTableViewCellController.register(in: (tableView)!)
    SignUpEmailTableViewCellController.register(in: (tableView)!)
    SignUpPasswordTableViewCellController.register(in: (tableView)!)
  }
  
  func prepareTableViewDataSource() {
    sectionsControllers = []
    
    let sectionController = DefaultTableViewSectionController()
    
    let avatarMainTableViewCellController = SignUpAvatarTableViewCellController()
    sectionController.cellsControllers.append(avatarMainTableViewCellController)
    
    let usernameTableViewCellController = SignUpUsernameTableViewCellController()
    sectionController.cellsControllers.append(usernameTableViewCellController)
    
    let emailTableViewCellController = SignUpEmailTableViewCellController()
    sectionController.cellsControllers.append(emailTableViewCellController)
    
    let passwordTableViewCellController = SignUpPasswordTableViewCellController()
    sectionController.cellsControllers.append(passwordTableViewCellController)
    
    sectionsControllers.append(sectionController)
  }

}
