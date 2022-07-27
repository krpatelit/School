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
/*
    func testSchoolDetailViewModel() {
        let network = MockNetworkManager()
         let dataManager = SchoolDetailDataManager(network)

        guard let data = network.getData(from: "SchoolList") else {
            XCTFail("SchoolList mock json could not read")
            return
        }
        let schoolList = try? JSONDecoder().decode(SchoolList.self, from: data)
        guard let school = schoolList?.schools.first else {
            XCTFail("SchoolList mock json could not decoded")
            return
        }
        let viewModel = SchoolDetailViewModel(dataManager, school: school)
        let request = MockRequest.schooldDetail(dbn: "")
        viewModel.fetchSchoolDetail(request) { isSuccess in
             if isSuccess {
                 XCTAssertNotNil(viewModel.detail, "Detail is not set")
             } else {
                 XCTFail("SchoolDetail failed the api response")
             }
         }
    }*/

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
