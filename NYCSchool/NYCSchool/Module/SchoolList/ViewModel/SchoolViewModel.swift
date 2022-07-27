//
//  SchoolViewModel.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

//This is ViewModel of DataSource Model
protocol SchoolViewProtocol {
    var dbn: String? { get }
    var schoolName: String? { get }
    var location: String? { get }
    var city: String? { get }
    var zip: String? { get }
}

struct SchoolViewModel: SchoolViewProtocol {

    private let item: SchoolList.School

    init(_ item: SchoolList.School) {
        self.item = item
    }

    var dbn: String? {
        item.dbn
    }

    var schoolName: String? {
        item.schoolName
    }

    var city: String? {
        item.city
    }

    var location: String? {
        item.location
    }

    var zip: String? {
        item.zip
    }
}
