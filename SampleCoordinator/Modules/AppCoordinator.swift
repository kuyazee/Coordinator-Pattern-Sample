//
//  AppCoordinator.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []
  
  let window: UIWindow
  let persistenceService: PersistenceService
  
  init(window: UIWindow, persistenceService: PersistenceService) {
    self.window = window
    self.persistenceService = persistenceService
    self.window.rootViewController = UIViewController()
    self.window.makeKeyAndVisible()
  }
  
  func start(withCallback completion: CoordinatorCallback?) {
    if self.persistenceService.isUserLoggedIn {
      let mainCoordinator = MainCoordinator(
        rootViewController: MainViewController(),
        presentingViewController: self.window.rootViewController!
      )
      self.add(childCoordinator: mainCoordinator, andStart: completion)
    } else {
      let loginCoordinator = LoginCoordinator(
        rootViewController: LoginViewController(),
        presentingViewController: self.window.rootViewController!
      )
      self.add(childCoordinator: loginCoordinator, andStart: completion)
    }
  }
  
  func stop(withCallback completion: CoordinatorCallback?) {
    // nothing here since you can't stop the app coordinator
  }
}
