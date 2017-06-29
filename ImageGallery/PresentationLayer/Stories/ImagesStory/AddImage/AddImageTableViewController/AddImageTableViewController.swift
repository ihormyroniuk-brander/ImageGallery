//
//  AddImageTableViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageTableViewController: DefaultTableViewController, ImageAddImageTableViewCellControllerDelegate {

  override func loadView() {
    super.loadView()
    
    self.tableView = AddImageTableView()
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      registerTableView()
      prepareTableViewDataSource()
      self.tableView.reloadData()
    }
  
  // MARK: UITableView
  
  func registerTableView() {
    ImageAddImageTableViewCellController.register(in: (tableView)!)
    AddImageDescriptionTableViewCellController.register(in: (tableView)!)
    AddImageHashtagTableViewCellController.register(in: (tableView)!)
  }
  
  let imageAddImageTableViewCellController = ImageAddImageTableViewCellController()
  let descriptionTableViewCellController = AddImageDescriptionTableViewCellController()
  let hashtagTableViewCellController = AddImageHashtagTableViewCellController()
  
  func prepareTableViewDataSource() {
    sectionsControllers = []
    
    let sectionController = DefaultTableViewSectionController()
    
    imageAddImageTableViewCellController.delegate = self
    sectionController.cellsControllers.append(imageAddImageTableViewCellController)
    
    sectionController.cellsControllers.append(descriptionTableViewCellController)
    
    sectionController.cellsControllers.append(hashtagTableViewCellController)
    
    sectionsControllers.append(sectionController)
  }
  
  // MARK: ImageAddImageTableViewCellControllerDelegate
  
  func present(imagePickerController: UIImagePickerController) {
    self.present(imagePickerController, animated: true, completion: nil)
  }

  func dismiss(imagePickerController: UIImagePickerController) {
    imagePickerController.dismiss(animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.endEditing(true)
  }
  
}
