//
//  MockNetworkManager.swift
//  NYCSchoolTests
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation
import XCTest
@testable import NYCSchool

extension Bundle {
    static var current: Bundle {
        class __ { }
        return Bundle(for: __.self)
    }
}

class MockNetworkManager: Networking {

    func getData(from jsonfileName: String) -> Data? {
        if let bundlePath = Bundle.current.path(forResource: jsonfileName, ofType: "json"),
           let data = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            return data
        }
        return nil
    }

    func request<T>(request: RequestProtocol, callBack: @escaping (Result<T, Failure>) -> Void) where T : Decodable {
        if let data = self.getData(from: request.url) {
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(T.self, from: data) {
                callBack(.success(model))
            } else {
                callBack(.failure(.parsingError))
            }
        } else {
            callBack(.failure(.badRespons))
        }
    }
}
