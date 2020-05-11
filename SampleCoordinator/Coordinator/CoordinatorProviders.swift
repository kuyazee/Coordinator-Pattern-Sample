//
//  CoordinatorProviders.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

public protocol RootViewControllerProvider: AnyObject {
    associatedtype RootViewController where RootViewController: UIViewController

    /// The coordinators `rootViewController`. It helps to think of this as the view
    /// controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: RootViewController { get }
}

public protocol NavigationControllerProvider: AnyObject {
    associatedtype NavigationController where NavigationController: UINavigationController

    /// The coordinators `navigationController`. It helps to think of this as the view
    /// controller handling push and pop, this is also the controller that can be used to
    /// dismiss the coordinator from the view hierarchy.
    var navigationController: NavigationController { get }
}

public protocol PresentingControllerProvider: AnyObject {
    associatedtype PresentingViewController where PresentingViewController: UIViewController

    /// The coordinator`s `presentingViewController`. It helps to think of this
    /// as the view that will present any kind of `UIViewController`.
    var presentingViewController: PresentingViewController { get set }
}

