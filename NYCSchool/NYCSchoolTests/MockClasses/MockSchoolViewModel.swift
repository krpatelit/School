//
//  MockSchoolViewModel.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import XCTest
@testable import NYCSchool

struct MockSchoolViewModel: SchoolViewProtocol {

    var dbn: String? = "12345"
    var schoolName: String? = "NYC School"
    var location: String? = "Long Island beach"
    var city: String? = "NYC"
    var zip: String? = "98001"

}
