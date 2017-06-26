//
//  DefaultTableViewCellController.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/29/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

class DefaultTableViewCellController: NSObject, TableViewCellController {

    
    // MARK: Reuse Registration
    
    class func register(in tableView: UITableView) {
        
    }
    
    
    // MARK: Cell Life Cycle
    
    func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func cellWillDisplay(at indexPath: IndexPath, in tableView: UITableView) {
        
    }
    
    func cellDidEndDisplaying(at indexPath: IndexPath, in tableView: UITableView) {
        
    }
    
    
    // MARK: Selection
    
    var shouldHighlight: Bool {
        return true
    }
    
    func didHighlight() {
        
    }
    
    func didUnhighlight() {
        
    }
    
    func willSelect() {
        
    }
    
    func didSelect() {
        
    }
    
    func willDeselect() {
        
    }
    
    func didDeselect() {
        
    }

    
    // MARK: Height
    
    var estimatedHeight: CGFloat {
        return 0.0
    }
    
    var height: CGFloat {
        return 44.0
    }
    
    
}
