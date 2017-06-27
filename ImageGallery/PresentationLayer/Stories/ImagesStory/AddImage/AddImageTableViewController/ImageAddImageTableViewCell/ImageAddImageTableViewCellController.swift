//
//  ImageAddImageTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

protocol ImageAddImageTableViewCellControllerDelegate {
  func present(imagePickerController: UIImagePickerController)
  func dismiss(imagePickerController: UIImagePickerController)
}

class ImageAddImageTableViewCellController: DefaultTableViewCellController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  var delegate: ImageAddImageTableViewCellControllerDelegate?
  
  override init() {
    super.init()
    imagePickerController.delegate = self
  }
  
  let imageImageViewTapGestureRecognizer = UITapGestureRecognizer()
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(ImageAddImageTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(ImageAddImageTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: ImageAddImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ImageAddImageTableViewCell.self), for: indexPath) as! ImageAddImageTableViewCell
    //cell.imageImageView.gestureRecognizers = []
    imageImageViewTapGestureRecognizer.addTarget(self, action: #selector(imageImageViewTapGestureRecognizerAction(tapGestureRecognizer:)))
    cell.imageImageView.addGestureRecognizer(imageImageViewTapGestureRecognizer)
    cell.imageImageView.image = image
    return cell
  }
  
  override var estimatedHeight: CGFloat {
    return 318
  }
  
  override var height: CGFloat {
    return UITableViewAutomaticDimension
  }
  
  // MARK: UIImagePickerController
  
  let imagePickerController = UIImagePickerController()
  
  var image: UIImage?
  
  func imageImageViewTapGestureRecognizerAction(tapGestureRecognizer: UITapGestureRecognizer) {
    imagePickerController.sourceType = .camera;
    imagePickerController.allowsEditing = false
    delegate?.present(imagePickerController: imagePickerController)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    image = info[UIImagePickerControllerOriginalImage] as! UIImage
    (delegate as! UITableViewController).tableView.reloadData()
    delegate?.dismiss(imagePickerController: picker)
  }
  
}
