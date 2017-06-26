//
//  TableViewSectionHeaderViewController.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/25/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import Foundation

import UIKit

protocol TableViewSectionHeaderFooterViewController {
    
    
    // MARK: Reuse Registration
    
    static func register(in tableView: UITableView)
    
    
    // MARK: View Life Cycle
    
    func view(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView?
    
    func viewWillDisplay(in section: Int, in tableView: UITableView)
    
    func viewDidEndDisplaying(in section: Int, in tableView: UITableView)
    
    
    // MARK: Height
    
    var estimatedHeight: CGFloat { get }
    
    var height: CGFloat { get }
    
    
}
