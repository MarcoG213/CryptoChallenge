//
//  ExchangeRateStrategy.swift
//  Domain
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public protocol ExchangeRateStrategy {
    func fetchExchangeRate(base: String, target: String) async throws -> Double
}
