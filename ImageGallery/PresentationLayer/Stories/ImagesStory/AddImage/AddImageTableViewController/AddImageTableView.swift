//
//  AddImageTableView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AddImageTableView: UITableView {

  init() {
    super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    
    self.backgroundColor = UIColor.purple
    self.separatorStyle = UITableViewCellSeparatorStyle.none
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
