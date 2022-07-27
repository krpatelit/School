//
//  SchoolCoordinator.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import UIKit

class SchoolCoordinator : ChildCoordinator {

    internal weak var parentCoordinator: ParentCoordinator?
    internal var navigationController: UINavigationController
    let networkManager: Networking

    init(with _navigationController: UINavigationController, networkManager: Networking) {
        self.navigationController = _navigationController
        self.networkManager = networkManager
    }

    func configureChildViewController() {
            let schoolListVC = Storyboardable<SchoolListViewController>.main.instantiateViewController { [weak self] coder in
                guard let self = self else { return UIViewController() }
                let dataManager = SchoolListDataManager(self.networkManager)
                let viewModel = SchoolListViewModel(dataManager)
                let controller =  SchoolListViewController(viewModel, coder: coder)
                controller?.coordinator = self
                return controller
            }
            self.navigationController.setViewControllers([schoolListVC], animated: true)
    }

    func coordinateToDetailPage(with schoolViewModel: SchoolViewProtocol) {

        let schoolDetailVC = Storyboardable<SchoolDetailViewController>.main.instantiateViewController { [weak self] coder in
            guard let self = self else { return UIViewController() }
            let dataManager = SchoolDetailDataManager(self.networkManager)
            let viewModel = SchoolDetailViewModel(dataManager,
                                                  schoolViewModel: schoolViewModel)

            let controller = SchoolDetailViewController(viewModel, coder: coder)
            controller?.coordinator = self
            return controller
        }
        self.navigationController.pushViewController(schoolDetailVC, animated: true)
    }
}
