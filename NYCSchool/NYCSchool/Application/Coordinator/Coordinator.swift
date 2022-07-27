//
//  Coordinator.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/26/22.
//

import Foundation
import  UIKit

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator : Coordinator {
    var childCoordinator: [ChildCoordinator] { get set }
    func configureRootViewController()// Initialize a child coordinator
    func removeChildCoordinator(child: ChildCoordinator)
}

protocol ChildCoordinator : Coordinator {
    var parentCoordinator : ParentCoordinator? { get set }
    func configureChildViewController() // Initialize a View Controller
}
