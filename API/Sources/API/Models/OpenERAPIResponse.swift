//
//  OpenERAPIResponse.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public struct OpenERAPIResponse: Decodable {
    public let result: String
    public let conversionRates: [String: Double]

    public enum CodingKeys: String, CodingKey {
        case result
        case conversionRates = "rates"
    }
}
