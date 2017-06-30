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
  static var persistentStoreCoordinator: NSPersistentStoreCoordinator?
  
  static func setup() {
    guard let modelURL = Bundle.main.url(forResource: "ImageGallery", withExtension:"momd") else {
      fatalError("Error loading model from bundle")
    }
    
    guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
      fatalError("Error initializing mom from: \(modelURL)")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    CoreData.mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    CoreData.mainManagedObjectContext?.persistentStoreCoordinator = psc
    persistentStoreCoordinator = psc
    
    do {
      try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: FileSystem.imageGallerySQLiteFile, options: nil)
    } catch {
      fatalError("Error migrating store: \(error)")
    }
  }
  
  static var backgroundManagedObjectContext: NSManagedObjectContext {
    get {
      let backgroundManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
      backgroundManagedObjectContext.parent = mainManagedObjectContext
      return backgroundManagedObjectContext
    }
  }
  
}
