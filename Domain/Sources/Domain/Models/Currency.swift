//
//  Currency.swift
//  Domain
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public protocol Currency: Sendable {
    var symbol: String { get }
    var baseAsset: String { get }
    var quoteAsset: String { get }
    var price: Double { get }
}
