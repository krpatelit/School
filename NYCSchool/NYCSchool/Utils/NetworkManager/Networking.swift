//
//  Networking.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(request: RequestProtocol, callBack: @escaping (Result<T, Failure>) -> Void)
}
