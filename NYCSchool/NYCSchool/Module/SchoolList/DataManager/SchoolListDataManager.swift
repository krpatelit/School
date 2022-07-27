//
//  SchoolListDataManager.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

protocol SchoolListDataProtocol {
    func fetchSchoolList(_ request: RequestProtocol, callBack: @escaping (Result<SchoolList, Failure>) -> Void)
}

struct SchoolListDataManager: SchoolListDataProtocol {

    private let newtork: Networking

    init(_ network: Networking) {
        self.newtork = network
    }

    func fetchSchoolList(_ request: RequestProtocol, callBack: @escaping (Result<SchoolList, Failure>) -> Void) {
        newtork.request(request: request, callBack: callBack)
    }
}
