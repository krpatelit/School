//
//  SchoolDetailDataManager.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

protocol SchoolDetailDataProtocol {
    func fetchSchoolDetail(_ request: RequestProtocol, callBack: @escaping (Result<SchoolDetail, Failure>) -> Void)
}


struct SchoolDetailDataManager: SchoolDetailDataProtocol {

    private let newtork: Networking

    init(_ network: Networking) {
        self.newtork = network
    }

    func fetchSchoolDetail(_ request: RequestProtocol, callBack: @escaping (Result<SchoolDetail, Failure>) -> Void) {
        newtork.request(request: request, callBack: callBack)
    }
}
