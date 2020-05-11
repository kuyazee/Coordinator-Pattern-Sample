//
//  MainCoordinator.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator, RootViewControllerProvider, PresentingControllerProvider {
  var childCoordinators: [Coordinator] = []
  var rootViewController: MainViewController
  var presentingViewController: UIViewController
  
  init(rootViewController: MainViewController, presentingViewController: UIViewController) {
    self.rootViewController = rootViewController
    self.presentingViewController = presentingViewController
  }
  
  func start(withCallback completion: CoordinatorCallback?) {
      self.presentingViewController.present(self.rootViewController, animated: true) {
          completion?(self)
      }
  }

  func stop(withCallback completion: CoordinatorCallback?) {
      self.presentingViewController.dismiss(animated: true) {
          completion?(self)
      }
  }
}

