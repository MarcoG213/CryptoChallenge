//
//  NetworkClientProtocol.swift
//  NetworkLayer
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public protocol NetworkClientProtocol {
    func fetch<T: Decodable>(_ type: T.Type, from request: URLRequest) async throws -> T
}
