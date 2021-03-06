//
//  AllImagesViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

class AllImagesViewController: UIViewController {

  private let allImagesCollectionViewController = AllImagesCollectionViewController.init(collectionViewLayout: UICollectionViewFlowLayout())
  private let customView = AllImagesView()
  
  
  override func loadView() {
    self.view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    let button1 = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AllImagesViewController.sayHello))
    let button2 = UIBarButtonItem(title: "GIF", style: .plain, target: self, action: #selector(AllImagesViewController.sayHi))
    self.navigationItem.rightBarButtonItems  = [button1, button2]
    self.navigationItem.title = "All images"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    allImagesCollectionViewController.viewWillAppear(animated)
  }
  
  
  func setupView() {
    self.addChildViewController(allImagesCollectionViewController)
    allImagesCollectionViewController.willMove(toParentViewController: self)
    customView.place(allImagesCollectionView: allImagesCollectionViewController.collectionView!)
  }
  
  func sayHello(sender: UIBarButtonItem) {
    navigationController?.pushViewController(AddImageViewController(), animated: true)
  }
  
  func sayHi(sender: UIBarButtonItem) {
    let viewController = GIFViewController()
    viewController.modalPresentationStyle = .overCurrentContext
    present(viewController, animated: false, completion: nil)
  }
}
