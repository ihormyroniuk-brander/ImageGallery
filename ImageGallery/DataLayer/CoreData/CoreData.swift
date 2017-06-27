//
//  CoreData.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

import CoreData

class CoreData: NSObject {
  
  static var mainManagedObjectContext: NSManagedObjectContext?
  
  static func setup() {
    guard let modelURL = Bundle.main.url(forResource: "ImageGallery", withExtension:"momd") else {
      fatalError("Error loading model from bundle")
    }
    
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
      fatalError("Error initializing mom from: \(modelURL)")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    CoreData.mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    CoreData.mainManagedObjectContext?.persistentStoreCoordinator = psc
    
    do {
      try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: FileSystem.ImageGallerySQLite, options: nil)
    } catch {
      fatalError("Error migrating store: \(error)")
    }
  }
  
  
}
