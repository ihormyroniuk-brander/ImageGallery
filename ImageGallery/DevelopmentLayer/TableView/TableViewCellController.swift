//
//  TableViewCell.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/23/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import Foundation

import UIKit

protocol TableViewCellController {
    
    
    // MARK: Reuse Registration
    
    static func register(in tableView: UITableView)
    
    
    // MARK: Cell Life Cycle
    
    func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    
    func cellWillDisplay(at indexPath: IndexPath, in tableView: UITableView)
    
    func cellDidEndDisplaying(at indexPath: IndexPath, in tableView: UITableView)
    
    
    // MARK: Selection
    
    var shouldHighlight: Bool { get }
    
    func didHighlight()
    
    func didUnhighlight()
    
    func willSelect()
    
    func didSelect()
    
    func willDeselect()
    
    func didDeselect()
    

    // MARK: Height
    
    var estimatedHeight: CGFloat { get }
    
    var height: CGFloat { get }

    
}
