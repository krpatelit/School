//
//  SchoolListViewModel.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

protocol SchoolListViewProtocol {
    var numberOfRow: Int { get }

    //To be set on ViewController
    var updateUI: (() -> ())? { get set }
    //To be set on ViewController
    var showError: ((String) -> ())? { get set }

    func itemAtIndexPath(_ index: Int) -> SchoolViewProtocol
    func schoolListRequest() -> RequestProtocol
    func fetchSchool(_ request: RequestProtocol)
}

class SchoolListViewModel: SchoolListViewProtocol {
    private var schools: [SchoolList.School] = []
    private var schoolViewModels: [SchoolViewProtocol] = []
    private let dataManager: SchoolListDataProtocol
    //To be set on ViewController
    var updateUI: (() -> ())?
    //To be set on ViewController
    var showError: ((String) -> ())?
    
    required init(_ dataManager: SchoolListDataProtocol) {
        self.dataManager = dataManager
    }

    var numberOfRow: Int {
        schoolViewModels.count
    }

    func itemAtIndexPath(_ index: Int) -> SchoolViewProtocol {
        schoolViewModels[index]
    }

    func schoolListRequest() -> RequestProtocol {
        SchoolRequest.schoolList
    }

    func fetchSchool(_ request: RequestProtocol) {
        dataManager.fetchSchoolList(request) { [weak self] response in
            switch response {
            case .failure(let error):
                print("Failed with error \(error)")
                //TODO:: Error message should be user friendly
                //Block will be called to ViewController
                self?.showError?("Fetch School list api failed!!!")
            case .success(let result):
                print(result.schools)
                self?.schools = result.schools
                self?.schoolViewModels = result.schools.map { SchoolViewModel($0) }
                //Block will be called to ViewController
                self?.updateUI?()
            }
        }
    }
}
