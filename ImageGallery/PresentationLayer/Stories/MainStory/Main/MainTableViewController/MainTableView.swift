//
//  MainTableView.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainTableView: UITableView {

  init() {
    super.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    self.separatorStyle = UITableViewCellSeparatorStyle.none
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
