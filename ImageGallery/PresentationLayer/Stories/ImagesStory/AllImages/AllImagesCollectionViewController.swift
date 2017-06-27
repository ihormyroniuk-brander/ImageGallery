//
//  AllImagesCollectionViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AllImagesCollectionViewController: UICollectionViewController {

  var images: [IGImage] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      APIImagesAllImages.requestWith(token: "1976b3c0a8b7941199b43a1456a20ef1",
                                     success: { (images, GIFImages) in
                      self.images = images
                                      self.collectionView?.reloadData()
      }) { (error) in
        
      }
      
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ImageAllImagesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
      self.collectionView?.isScrollEnabled = true
      self.collectionView?.bounces = true
      self.collectionView?.alwaysBounceVertical = true
      (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: (UIScreen.main.bounds.width - 60) / 2,
                                                                                   height: 120)
      (self.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing = 20
      (self.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageAllImagesCollectionViewCell
      cell.set(imageURL: URL(string: self.images[indexPath.item].smallImageURLString!)!)
        // Configure the cell
    cell.set(weatherText: self.images[indexPath.item].weather)
      cell.set(addressText: self.images[indexPath.item].address)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}