//
//  File.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/30/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import Foundation

import UIKit

protocol TableViewSectionController {
    
    
    // MARK: Header
    
    func headerView(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView?
    
    func headerViewWillDisplay(in section: Int, in tableView: UITableView)
    
    func headerViewDidEndDisplaying(in section: Int, in tableView: UITableView)
    
    func headerViewEstimatedHeight() -> CGFloat
    
    func headerViewHeight() -> CGFloat
    
    
    // MARK: Footer
    
    func footerView(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView?
    
    func footerViewWillDisplay(in section: Int, in tableView: UITableView)
    
    func footerViewDidEndDisplaying(in section: Int, in tableView: UITableView)
    
    func footerViewEstimatedHeight() -> CGFloat
    
    func footerViewHeight() -> CGFloat
    
    
    // MARK: Cells
    
    func numberOfCells() -> Int
    
    func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    
    func cellWillDisplay(at indexPath: IndexPath, in tableView: UITableView)
    
    func cellDidEndDisplaying(at indexPath: IndexPath, in tableView: UITableView)
    
    func cellEstimatedHeight(in row: Int) -> CGFloat
    
    func cellHeight(in row: Int) -> CGFloat
    
    func cellShouldHighlight(in row: Int) -> Bool
    
    func cellDidHighlight(in row: Int)
    
    func cellDidUnhighlight(in row: Int)
    
    func cellWillSelect(in row: Int)
    
    func cellDidSelect(in row: Int)
    
    func cellWillDeselect(in row: Int)
    
    func cellDidDeselect(in row: Int)
    
    
}
