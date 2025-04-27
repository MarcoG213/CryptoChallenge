//
//  ForexError.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public enum ForexError: Error, Equatable {
    case invalidURL
    case decodingFailure
    case missingRate(String)
    case emptyResponse
}
