//
//  SignUpTableView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/29/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class SignUpTableView: UITableView {

  // MARK: Initializars
  
  init() {
    super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    self.separatorStyle = UITableViewCellSeparatorStyle.none
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
