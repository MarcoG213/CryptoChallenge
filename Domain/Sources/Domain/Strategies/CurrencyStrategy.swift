//
//  CurrencyStrategy.swift
//  Domain
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public protocol CurrencyStrategy {
    func fetchCurrencies(_ type: CurrencyType) async throws -> [Currency]
}
