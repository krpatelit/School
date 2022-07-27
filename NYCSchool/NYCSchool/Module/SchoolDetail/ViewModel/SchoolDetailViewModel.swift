//
//  SchoolDetailViewModel.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

protocol SchoolDetailViewProtocol {

    //School Info from prev page
    var dbn: String? { get }
    var schoolName: String { get }
    var location: String { get }
    var city: String { get }
    var zip: String { get }

    //From detail api
    var satTestTakers: String { get }
    var satAvgReadingScore: String { get }
    var satAvgWritingScore: String { get }
    var satAvgMathScore: String { get }

    //To be set on ViewController
    var updateUI: (() -> ())? { get set }
    //To be set on ViewController
    var showError: ((String) -> ())? { get set }

    func schoolDetailRequest() -> RequestProtocol
    func fetchSchoolDetail(_ request: RequestProtocol)
}

class SchoolDetailViewModel: SchoolDetailViewProtocol {

    private let schoolViewModel: SchoolViewProtocol
    private var detail: SchoolDetail.Detail?
    private let dataManager: SchoolDetailDataProtocol
    //To be set on ViewController, to updateUI
    var updateUI: (() -> ())?
    //To be set on ViewController
    var showError: ((String) -> ())?

    private let defaultValue = "N/A"

    required init(_ dataManager: SchoolDetailDataProtocol,
                  schoolViewModel: SchoolViewProtocol) {
        self.dataManager = dataManager
        self.schoolViewModel = schoolViewModel
    }

    func schoolDetailRequest() -> RequestProtocol {
        SchoolRequest.schooldDetail(dbn: self.schoolViewModel.dbn ?? "")
    }

    func fetchSchoolDetail(_ request: RequestProtocol) {
        dataManager.fetchSchoolDetail(request) { [weak self] response in
            switch response {
            case .failure(let error):
                print("Failed with error \(error)")
                self?.showError?("Detail api failed!")
            case .success(let result):

                if let detail = result.detail {
                    self?.detail = detail
                    self?.updateUI?()
                } else {
                    //Show error if needed
                    self?.showError?("No Sat data available")
                }
                //print(result.detail ?? "nil")
            }
        }
    }
}

//School Info from previous page
extension SchoolDetailViewModel {

    var dbn: String? {
        schoolViewModel.dbn
    }

    var schoolName: String {
        schoolViewModel.schoolName ?? defaultValue
    }
    var location: String {
        schoolViewModel.location ?? defaultValue
    }
    var city: String {
        schoolViewModel.city ?? defaultValue
    }
    var zip: String {
        schoolViewModel.zip ?? defaultValue
    }

}

//Detail Info from Detail API
extension SchoolDetailViewModel {

    var satTestTakers: String {
        detail?.satTestTakers ?? defaultValue
    }

    var satAvgReadingScore: String {
        detail?.satAvgReadingScore ?? defaultValue
    }

    var satAvgWritingScore: String {
        detail?.satAvgWritingScore ?? defaultValue
    }

    var satAvgMathScore: String {
        detail?.satAvgMathScore ?? defaultValue
    }
}


