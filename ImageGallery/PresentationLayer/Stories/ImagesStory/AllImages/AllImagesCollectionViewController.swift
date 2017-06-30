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

  var images: [Image] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ImageAllImagesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.white
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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    APIImagesAllImages.requestWith(token: Application.user?.token, success: { (images, GIFImages) in
      /*self.images = images
      self.collectionView?.reloadData()*/
      
      let privateManagedObjectContext = CoreData.backgroundManagedObjectContext
      privateManagedObjectContext.perform({
        for image in images {
          let moImage = MOImage(context: privateManagedObjectContext)
        }
      })
    }) { (error) in
      
    }
  }

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
}
