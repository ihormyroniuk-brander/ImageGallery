//
//  DefaultTableViewSectionController.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 6/1/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

class DefaultTableViewSectionController: NSObject, TableViewSectionController {

    
    // MARK: Header
    
    var headerViewController: TableViewSectionHeaderFooterViewController = DefaultTableViewSectionHeaderFooterViewController()
    
    func headerView(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView? {
        return headerViewController.view(in: section, in: tableView)
    }
    
    func headerViewWillDisplay(in section: Int, in tableView: UITableView) {
        headerViewController.viewWillDisplay(in: section, in: tableView)
    }
    
    func headerViewDidEndDisplaying(in section: Int, in tableView: UITableView) {
        headerViewController.viewDidEndDisplaying(in: section, in: tableView)
    }
    
    func headerViewEstimatedHeight() -> CGFloat {
        return headerViewController.estimatedHeight
    }
    
    func headerViewHeight() -> CGFloat {
        return headerViewController.height
    }
    
    
    // MARK: Footer
    
    var footerViewController: TableViewSectionHeaderFooterViewController = DefaultTableViewSectionHeaderFooterViewController()
    
    func footerView(in section: Int, in tableView: UITableView) -> UITableViewHeaderFooterView? {
        return footerViewController.view(in: section, in: tableView)
    }
    
    func footerViewWillDisplay(in section: Int, in tableView: UITableView) {
        footerViewController.viewWillDisplay(in: section, in: tableView)
    }
    
    func footerViewDidEndDisplaying(in section: Int, in tableView: UITableView) {
        footerViewController.viewDidEndDisplaying(in: section, in: tableView)
    }
    
    func footerViewEstimatedHeight() -> CGFloat {
        return footerViewController.estimatedHeight
    }
    
    func footerViewHeight() -> CGFloat {
        return footerViewController.height
    }
    
    
    // MARK: Cells
    
    var cellsControllers: [TableViewCellController] = []
    
    func numberOfCells() -> Int {
        return cellsControllers.count
    }
    
    func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return cellsControllers[indexPath.row].cell(at: indexPath, in:tableView)
    }
    
    func cellWillDisplay(at indexPath: IndexPath, in tableView: UITableView) {
        cellsControllers[indexPath.row].cellWillDisplay(at: indexPath, in:tableView)
    }
    
    func cellDidEndDisplaying(at indexPath: IndexPath, in tableView: UITableView) {
        cellsControllers[indexPath.row].cellDidEndDisplaying(at: indexPath, in:tableView)
    }
    
    func cellEstimatedHeight(in row: Int) -> CGFloat {
        return cellsControllers[row].estimatedHeight
    }
    
    func cellHeight(in row: Int) -> CGFloat {
        return cellsControllers[row].height
    }
    
    func cellShouldHighlight(in row: Int) -> Bool {
        return cellsControllers[row].shouldHighlight
    }
    
    func cellDidHighlight(in row: Int) {
        cellsControllers[row].didHighlight()
    }
    
    func cellDidUnhighlight(in row: Int) {
        cellsControllers[row].didUnhighlight()
    }
    
    func cellWillSelect(in row: Int) {
        cellsControllers[row].willSelect()
    }
    
    func cellDidSelect(in row: Int) {
        cellsControllers[row].didSelect()
    }
    
    func cellWillDeselect(in row: Int) {
        cellsControllers[row].willDeselect()
    }
    
    func cellDidDeselect(in row: Int) {
        cellsControllers[row].didDeselect()
    }
    
    
}
