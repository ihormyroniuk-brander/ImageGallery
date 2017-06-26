//
//  BaseTableViewController.swift
//  AppleNews
//
//  Created by Ihor Myroniuk on 5/26/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

class DefaultTableViewController: UITableViewController, TableViewController {
    
    init() {
        super.init(style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var sectionsControllers: Array<TableViewSectionController> = []
    
    // MARK: Cells
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sectionsControllers[indexPath.section].cell(at: indexPath, in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsControllers[section].numberOfCells()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionsControllers[indexPath.section].cellEstimatedHeight(in: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sectionsControllers[indexPath.section].cellHeight(in: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionsControllers[indexPath.section].cellDidSelect(in: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return sectionsControllers[indexPath.section].cellShouldHighlight(in: indexPath.row)
    }
    
    
    // MARK: Sections
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsControllers.count
    }
    
    
    // MARK: Sections Headers
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionsControllers[section].headerView(in: section, in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return sectionsControllers[section].headerViewEstimatedHeight()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionsControllers[section].headerViewHeight()
    }
    
    
    // MARK: Sections Footers

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionsControllers[section].footerView(in: section, in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return sectionsControllers[section].footerViewEstimatedHeight()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionsControllers[section].footerViewHeight()
    }
    
    
}
