//
//  AppDelegate.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
  var window: UIWindow?
  var appCoordinator: AppCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let persistenceService = PersistenceService()
    let window = UIWindow()
    self.window = window
    self.appCoordinator = AppCoordinator(
      window: window,
      persistenceService: persistenceService
    )
    self.appCoordinator.start(withCallback: nil)
    
    return true
  }
}

