//
//  FixtureType.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

enum FixtureType: String {
    case crypto = "crypto_mock"
    case exchange = "er_mock"

    var fileName: String {
        rawValue
    }

    var fileExtension: String {
        "json"
    }
}
