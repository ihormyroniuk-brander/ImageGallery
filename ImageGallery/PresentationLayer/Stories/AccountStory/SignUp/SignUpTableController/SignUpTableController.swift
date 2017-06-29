//
//  SignUpTableController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpTableController: DefaultTableViewController, SignUpAvatarTableViewCellControllerDelegate {
  
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
  
  var avatarTableViewCellController = SignUpAvatarTableViewCellController()
  var usernameTableViewCellController = SignUpUsernameTableViewCellController()
  var emailTableViewCellController = SignUpEmailTableViewCellController()
  var passwordTableViewCellController = SignUpPasswordTableViewCellController()
  
  func registerTableView() {
    SignUpAvatarTableViewCellController.register(in: (tableView)!)
    SignUpUsernameTableViewCellController.register(in: (tableView)!)
    SignUpEmailTableViewCellController.register(in: (tableView)!)
    SignUpPasswordTableViewCellController.register(in: (tableView)!)
  }
  
  func prepareTableViewDataSource() {
    sectionsControllers = []
    
    let sectionController = DefaultTableViewSectionController()

    avatarTableViewCellController.delegate = self
    sectionController.cellsControllers.append(avatarTableViewCellController)
    
    sectionController.cellsControllers.append(usernameTableViewCellController)
    
    sectionController.cellsControllers.append(emailTableViewCellController)

    sectionController.cellsControllers.append(passwordTableViewCellController)
    
    sectionsControllers.append(sectionController)
  }

  // MARK: ImageAddImageTableViewCellControllerDelegate
  
  func present(imagePickerController: UIImagePickerController) {
    self.present(imagePickerController, animated: true, completion: nil)
  }
  
  func dismiss(imagePickerController: UIImagePickerController) {
    imagePickerController.dismiss(animated: true, completion: nil)
  }
  
}
