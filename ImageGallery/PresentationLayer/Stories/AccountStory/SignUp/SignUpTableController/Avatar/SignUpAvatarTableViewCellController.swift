//
//  SignUpAvatarTableViewCellController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

protocol SignUpAvatarTableViewCellControllerDelegate {
  func present(imagePickerController: UIImagePickerController)
  func dismiss(imagePickerController: UIImagePickerController)
}

class SignUpAvatarTableViewCellController: DefaultTableViewCellController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  var delegate: SignUpAvatarTableViewCellControllerDelegate?
  
  // MARK: Data
  
  public var avatar: UIImage? = UIImage(named: "avatar_placeholder")
  
  let avatarImageViewTapGestureRecognizer = UITapGestureRecognizer()
  
  // MARK: TableViewCellController
  
  override class func register(in tableView: UITableView) {
    tableView.register(SignUpAvatarTableViewCell.self,
                       forCellReuseIdentifier: NSStringFromClass(SignUpAvatarTableViewCell.self))
  }
  
  override func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let cell: SignUpAvatarTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SignUpAvatarTableViewCell.self)) as! SignUpAvatarTableViewCell
    cell.set(avatar: avatar ?? UIImage(named: "avatar_placeholder"))
    avatarImageViewTapGestureRecognizer.addTarget(self, action: #selector(imageImageViewTapGestureRecognizerAction(tapGestureRecognizer:)))
    cell.avatarImageView.gestureRecognizers = []
    cell.avatarImageView.addGestureRecognizer(avatarImageViewTapGestureRecognizer)
    return cell
  }
  
  override var estimatedHeight: CGFloat {
    return 318
  }
  
  override var height: CGFloat {
    return UITableViewAutomaticDimension
  }
  
  // MARK: UIImagePickerController
  
  func imageImageViewTapGestureRecognizerAction(tapGestureRecognizer: UITapGestureRecognizer) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .savedPhotosAlbum;
    imagePickerController.allowsEditing = false
    delegate?.present(imagePickerController: imagePickerController)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    avatar = info[UIImagePickerControllerOriginalImage] as? UIImage
    (delegate as! UITableViewController).tableView.reloadData()
    delegate?.dismiss(imagePickerController: picker)
  }
  
}
