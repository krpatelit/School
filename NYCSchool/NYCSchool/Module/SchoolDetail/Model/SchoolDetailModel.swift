//
//  SchoolDetailModel.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

struct SchoolDetail: Codable {
    let detail: Detail?
    struct Detail: Codable {
        let dbn: String?
        let schoolName: String?
        let satTestTakers: String?
        let satAvgReadingScore: String?
        let satAvgWritingScore: String?
        let satAvgMathScore: String?
        enum CodingKeys: String, CodingKey {
            case schoolName = "school_name"
            case satTestTakers = "num_of_sat_test_takers"
            case satAvgReadingScore = "sat_critical_reading_avg_score"
            case satAvgWritingScore = "sat_writing_avg_score"
            case satAvgMathScore = "sat_math_avg_score"
            case dbn
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let array: [Detail] = try container.decode([Detail].self)
        detail = array.first
    }
}
