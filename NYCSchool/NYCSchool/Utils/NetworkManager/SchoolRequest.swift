//
//  SchoolRequest.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

enum SchoolRequest: RequestProtocol, CustomStringConvertible {

    case schoolList
    case schooldDetail(dbn: String)

    var url: String {
        switch self {
        case .schoolList:
            //Given more time, prefer to do pagination
            return "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=50"
        case .schooldDetail(let dbn):
            return "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"
        }
    }

    var description: String {
        return "\(self.url)"
    }

    var method: String {
        return "GET"
    }

    var headers: [String: String]? {
        return nil
    }

    var postBody: Data? {
        return nil
    }

}
