//
//  MockRequest.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import XCTest
@testable import NYCSchool

enum MockRequest: RequestProtocol {

    case schoolList
    case schooldDetail(dbn: String)
    case failPath

    var url: String {
        switch self {
        case .schoolList:
            return "SchoolList"
        case .schooldDetail(_):
            return "SchoolDetail"
        case .failPath:
            return "failPath"
        }
    }
}

