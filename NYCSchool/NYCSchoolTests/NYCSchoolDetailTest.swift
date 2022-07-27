//
//  NYCSchoolDetailTest.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import XCTest
@testable import NYCSchool

class NYCSchoolDetailTest: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testSchoolDetailApiSuccess() {
        let network = MockNetworkManager()
        let dataManager = SchoolDetailDataManager(network)

        let mockSchoolVM = MockSchoolViewModel()
        let viewModel = SchoolDetailViewModel(dataManager, schoolViewModel: mockSchoolVM)
        viewModel.updateUI = {
            XCTAssertTrue(viewModel.satTestTakers.isEmpty == false, "Detail data updated")
        }
        viewModel.showError = { errorMessage in
            XCTFail("SchoolDetail API failed!!")
        }
        let request = MockRequest.schooldDetail(dbn: mockSchoolVM.dbn ?? "")
        viewModel.fetchSchoolDetail(request)
    }

    func testSchoolDetailApiFail() {
        let network = MockNetworkManager()
        let dataManager = SchoolDetailDataManager(network)

        let mockSchoolVM = MockSchoolViewModel()
        let viewModel = SchoolDetailViewModel(dataManager, schoolViewModel: mockSchoolVM)

        viewModel.showError = { errorMessage in
            XCTAssertTrue(errorMessage.isEmpty == false, "Api should failed with error message")
        }
        let request = MockRequest.failPath
        viewModel.fetchSchoolDetail(request)
    }

    func testSchoolDetailRequest() {
        let network = MockNetworkManager()
        let dataManager = SchoolDetailDataManager(network)

        let mockSchoolVM = MockSchoolViewModel()
        let viewModel = SchoolDetailViewModel(dataManager, schoolViewModel: mockSchoolVM)

        let request = viewModel.schoolDetailRequest() as? SchoolRequest
        switch request {
        case .schooldDetail(let dbn):
            XCTAssertEqual(dbn, mockSchoolVM.dbn)
        default:
            XCTFail("Request should be schoolList")
        }
    }

    func testSchoolDetailDataValidation() {
        let network = MockNetworkManager()
        let dataManager = SchoolDetailDataManager(network)

        let mockSchoolVM = MockSchoolViewModel()
        let viewModel = SchoolDetailViewModel(dataManager, schoolViewModel: mockSchoolVM)
        viewModel.updateUI = {
            XCTAssertEqual(viewModel.satTestTakers, "29")
            XCTAssertEqual(viewModel.satAvgMathScore, "404")
            XCTAssertEqual(viewModel.satAvgWritingScore, "363")
            XCTAssertEqual(viewModel.satAvgReadingScore, "355")
        }
        viewModel.showError = { errorMessage in
            XCTFail("SchoolDetail API failed!!")
        }
        let request = MockRequest.schooldDetail(dbn: mockSchoolVM.dbn ?? "")
        viewModel.fetchSchoolDetail(request)
    }




    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
