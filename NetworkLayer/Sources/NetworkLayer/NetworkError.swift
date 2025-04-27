//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public enum NetworkError: Error {
    case invalidResponse
    case decoding(Error)
}
