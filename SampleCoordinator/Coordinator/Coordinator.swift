//
//  Coordinator.swift
//  SampleCoordinator
//
//  Created by Zonily Jame Pesquera on 5/9/20.
//  Copyright © 2020 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

/// A callback function used by coordinators to signal events.
public typealias CoordinatorCallback = (Coordinator) -> Void

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }

    /// Tells the coordinator to create its
    /// initial view controller and take over the user flow.
    func start(withCallback completion: CoordinatorCallback?)

    /// Tells the coordinator that it is done and that it should
    /// rewind the view controller state to where it was before `start` was called.
    func stop(withCallback completion: CoordinatorCallback?)

    /// Add a child coordinator to the parent
    func add(childCoordinator: Coordinator)

    /// Remove a child coordinator from the parent
    func remove(childCoordinator: Coordinator)

    /// Add a child coordinator to the parent
    /// and then start the flow.
    func add(childCoordinator: Coordinator, andStart completion: CoordinatorCallback?)

    /// Remove a child coordinator from the parent
    /// and the end the flow.
    func remove(childCoordinator: Coordinator, andStop completion: CoordinatorCallback?)
}

// MARK: - Default Implementations

public extension Coordinator {
    func add(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func remove(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }

    func add(childCoordinator: Coordinator, andStart completion: CoordinatorCallback?) {
        self.add(childCoordinator: childCoordinator)
        childCoordinator.start(withCallback: completion)
    }

    func remove(childCoordinator: Coordinator, andStop completion: CoordinatorCallback?) {
        self.remove(childCoordinator: childCoordinator)
        childCoordinator.stop(withCallback: completion)
      
    }
}

extension Coordinator where Self: PresentingControllerProvider &
RootViewControllerProvider {
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

extension Coordinator where Self: PresentingControllerProvider &
    RootViewControllerProvider &
    NavigationControllerProvider {
    func start(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.present(self.navigationController, animated: true) {
            completion?(self)
        }
    }

    func stop(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.dismiss(animated: true) {
            completion?(self)
        }
    }
}

extension Coordinator where Self: PresentingControllerProvider &
    NavigationControllerProvider {
    func start(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.present(self.navigationController, animated: true) {
            completion?(self)
        }
    }

    func stop(withCallback completion: CoordinatorCallback?) {
        self.presentingViewController.dismiss(animated: true) {
            completion?(self)
        }
    }
}
