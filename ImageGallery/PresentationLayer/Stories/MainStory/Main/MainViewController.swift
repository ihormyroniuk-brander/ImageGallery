//
//  MainViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/26/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  var mainTableViewController : DefaultTableViewController?
  
  
  override func loadView() {
    self.view = MainView()
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    mainTableViewController = MainTableViewController()
    setupView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  // MARK: View
  
  private var selfView: MainView?
  
  func setupView() {
    selfView = self.view as? MainView
    self.addChildViewController(mainTableViewController!)
    mainTableViewController!.willMove(toParentViewController: self)
    selfView?.place(mainTableView: (mainTableViewController?.tableView)!)
  }

}
