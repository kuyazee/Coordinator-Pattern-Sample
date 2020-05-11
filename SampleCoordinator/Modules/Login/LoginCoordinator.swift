//
//  LoginCoordinator.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator, RootViewControllerProvider, PresentingControllerProvider {
  var childCoordinators: [Coordinator] = []
  var rootViewController: LoginViewController
  var presentingViewController: UIViewController
  
  init(rootViewController: LoginViewController, presentingViewController: UIViewController) {
    self.rootViewController = rootViewController
    self.presentingViewController = presentingViewController
  }
}
