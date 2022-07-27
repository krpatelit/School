//
//  ApplicationCoordinator.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/26/22.
//

import Foundation
import UIKit

class ApplicationCoordinator : ParentCoordinator {

    var navigationController: UINavigationController
    var childCoordinator: [ChildCoordinator] = [ChildCoordinator]()

    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }

    lazy var networkManager: Networking = {
        NetworkManager()
    }()

    func configureRootViewController() {
        let coordinator = SchoolCoordinator(with: self.navigationController,
                                            networkManager: networkManager)
        childCoordinator.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.configureChildViewController()

    }

    func removeChildCoordinator(child: ChildCoordinator) {
        for(index, coordinator) in childCoordinator.enumerated() {
            if(coordinator === child) {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
