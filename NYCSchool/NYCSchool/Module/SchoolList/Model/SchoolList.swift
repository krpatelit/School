//
//  SchoolList.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

struct SchoolList: Codable {
    var schools: [School] = []

    struct School: Codable {
        let schoolName: String?
        let schoolDescription: String?
        let dbn: String?
        let location: String?
        let zip: String?
        let city: String?
        enum CodingKeys: String, CodingKey {
            case schoolName = "school_name"
            case schoolDescription = "overview_paragraph"
            case location = "location"
            case zip = "zip"
            case city = "city"
            case dbn
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        schools = try container.decode([School].self)
    }
}
