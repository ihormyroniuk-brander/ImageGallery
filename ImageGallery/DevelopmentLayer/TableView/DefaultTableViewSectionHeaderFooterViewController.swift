//
//  DefaultTableViewSectionHeaderFooterViewController.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/29/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

class DefaultTableViewSectionHeaderFooterViewController: NSObject, TableViewSectionHeaderFooterViewController {

    
    // MARK: Reuse Registration
    
    class func register(in tableView: UITableView) {
        
    }
    
    
    // MARK: View Life Cycle
    
    func view(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView? {
        return nil
    }
    
    func viewWillDisplay(in section: Int, in tableView: UITableView) {
        
    }
    
    func viewDidEndDisplaying(in section: Int, in tableView: UITableView) {
        
    }
    
    
    // MARK: Height
    
    var estimatedHeight: CGFloat {
        return 0.0
    }
    
    var height: CGFloat {
        return 0.0
    }
    
    
}
