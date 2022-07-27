//
//  NYCSchoolListTest.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import XCTest
@testable import NYCSchool

class NYCSchoolListTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testSchoolListDataValidation() {
        let network = MockNetworkManager()
        let dataManager = SchoolListDataManager(network)
        let viewModel = SchoolListViewModel(dataManager)
        viewModel.updateUI = {
            XCTAssertEqual(viewModel.numberOfRow, 2)
            let item = viewModel.itemAtIndexPath(0)

            //Generally we recommand only assert statement per test case,
            //Appolosize for having multiple XCTAssert statemenet in one method
            XCTAssertEqual(item.dbn, "21K728")
            XCTAssertEqual(item.schoolName, "Liberation Diploma Plus High School")
            XCTAssertEqual(item.location, "2865 West 19th Street, Brooklyn, NY 11224 (40.576976, -73.985413)")
            XCTAssertEqual(item.city, "Brooklyn")
            XCTAssertEqual(item.zip, "11224")
        }
        viewModel.showError = { errorMessage in
            XCTFail("SchoolList failed the api response")
        }
        let request = MockRequest.schoolList
        viewModel.fetchSchool(request)
    }

    func testSchoolListRequestSuccess() {
        let network = MockNetworkManager()
        let dataManager = SchoolListDataManager(network)
        let viewModel = SchoolListViewModel(dataManager)
        viewModel.updateUI = {
            XCTAssertEqual(viewModel.numberOfRow, 2)
        }
        viewModel.showError = { errorMessage in
            XCTFail("SchoolList failed the api response")
        }
        let request = MockRequest.schoolList
        viewModel.fetchSchool(request)
    }

    func testSchoolListRequestFail() {
        let network = MockNetworkManager()
        let dataManager = SchoolListDataManager(network)
        let viewModel = SchoolListViewModel(dataManager)
        viewModel.updateUI = {
            XCTFail("SchoolList failed the api response")
        }
        viewModel.showError = { errorMessage in

        }
        let request = MockRequest.failPath
        viewModel.fetchSchool(request)
    }

    func testSchoolListRequest() {
        let network = MockNetworkManager()
        let dataManager = SchoolListDataManager(network)
        let viewModel = SchoolListViewModel(dataManager)
        let request = viewModel.schoolListRequest() as? SchoolRequest
        switch request {
        case .schoolList:
            break
        default:
            XCTFail("Request should be schoolList")
        }
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
