//
//  NYCSchoolTests.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/26/22.
//

import XCTest
@testable import NYCSchool

class NYCSchoolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSchoolRequestSchoolList() {

        //I would prefer to move all static urls and staic test data into some static struct
        XCTAssertEqual(SchoolRequest.schoolList.url, "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=50")
        XCTAssertEqual(SchoolRequest.schoolList.method, "GET")
        XCTAssertNil(SchoolRequest.schoolList.headers)
        XCTAssertNil(SchoolRequest.schoolList.postBody)
    }

    func testSchoolRequestSchoolDetail() {

        //I would prefer to move all static urls and staic test data into some static struct
        let detailRequest = SchoolRequest.schooldDetail(dbn: "123")
        XCTAssertEqual(detailRequest.url, "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\("123")")
        XCTAssertEqual(detailRequest.method, "GET")
        XCTAssertNil(detailRequest.headers)
        XCTAssertNil(detailRequest.postBody)
    }

    func testSchoolRequestProtocolMethods() {

        //I would prefer to move all static urls and staic test data into some static struct
        let mockRequest = MockRequest.schoolList
        XCTAssertEqual(mockRequest.url, "SchoolList")
        XCTAssertEqual(mockRequest.method, "GET")
        XCTAssertNil(mockRequest.headers)
        XCTAssertNil(mockRequest.postBody)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
