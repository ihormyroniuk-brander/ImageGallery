//
//  AddImageViewController.swift
//  ImageGallery
//
//  Created by Ihor Myroniuk on 6/27/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreLocation

class AddImageViewController: UIViewController, CLLocationManagerDelegate {

  let addImageTableViewController = AddImageTableViewController()
  private let customView = AddImageView()
  
  override func loadView() {
    self.view = customView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupView()
    setupLocationManager()
    updateLocation()
  }

  func setupView() {
    self.addChildViewController(addImageTableViewController)
    addImageTableViewController.willMove(toParentViewController: self)
    customView.place(addImageTableView: (addImageTableViewController.tableView)!)
    
    
    
    let button1 = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(AddImageViewController.addImageBarButtonItemAction))
    self.navigationItem.rightBarButtonItem  = button1
    self.navigationItem.title = "Add image"
  }
  
  // MARK: Actions
  
  func addImageBarButtonItemAction(sender: UIBarButtonItem) {
    let image = self.addImageTableViewController.imageAddImageTableViewCellController.image
    let description = self.addImageTableViewController.descriptionTableViewCellController.details
    let hashtag = self.addImageTableViewController.hashtagTableViewCellController.hashtag
    if image == nil {
      let alertController = UIAlertController(title: "Error", message: "Select image", preferredStyle: .alert)
      let continueAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
      alertController.addAction(continueAction)
      present(alertController, animated: true, completion: nil)
    }
    if currentLocation == nil {
      updateLocation()
    }
    let latitude = Float((currentLocation?.coordinate.latitude)!)
    let longitude = Float((currentLocation?.coordinate.longitude)!)
    SVProgressHUD.show()
    APIImagesAddImage.requestWith(token: Application.user?.token, image: image!, description: description, hashtag: hashtag, latitude: latitude, longitude: longitude, success: { (image) in
      SVProgressHUD.dismiss()
      self.navigationController?.popViewController(animated: true)
    }) { (error) in
      SVProgressHUD.dismiss()
      APIErrorAlertController.show(error: error, in: self, animated: true)
    }
  }
  
  // MARK: Location
  
  let locationManager: CLLocationManager = CLLocationManager()
  var currentLocation: CLLocation?

  func setupLocationManager() {
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.requestWhenInUseAuthorization();
  }
  
  func updateLocation() {
    if CLLocationManager.locationServicesEnabled() == false {
      showLocationManagerAlertLocationServicesDisabled()
    } else {
      if CLLocationManager.authorizationStatus() == .denied {
        showLocationManagerAlertAuthorizationStatusDenied()
      } else {
        locationManager.startUpdatingLocation();
      }
    }
  }
  
  func showLocationManagerAlertLocationServicesDisabled() {
    let alertController = UIAlertController(title: "Location Services Disabled", message: "Enable Location Services in Settings", preferredStyle: .alert)
    let continueAction = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
    alertController.addAction(continueAction)
    present(alertController, animated: true, completion: nil)
  }
  
  func showLocationManagerAlertAuthorizationStatusDenied() {
    let alertController = UIAlertController(title: "Authorization Status Denied", message: "Allow application use location services", preferredStyle: .alert)
    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alertAction) in
      guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
        return
      }
      if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, completionHandler: nil)
      }
    }
    alertController.addAction(settingsAction)
    let continueAction = UIAlertAction(title: "Continue", style: .cancel, handler: nil)
    alertController.addAction(continueAction)
    present(alertController, animated: true, completion: nil)
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    currentLocation = locations.first
  }
  
}
