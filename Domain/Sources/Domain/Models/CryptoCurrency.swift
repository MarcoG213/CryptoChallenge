//
//  CryptoCurrency.swift
//  Domain
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public struct CryptoCurrency: Identifiable, Codable, Currency, Sendable {
    public var id: String { symbol }

    public let symbol: String
    public let baseAsset: String
    public let quoteAsset: String
    public let price: Double
    public let openPrice: Double
    public let highPrice: Double
    public let lowPrice: Double
    public let volume: Double
    public let timestamp: Date
    public let change24h: Double?

    public init(symbol: String,
                baseAsset: String,
                quoteAsset: String,
                price: Double,
                openPrice: Double,
                highPrice: Double,
                lowPrice: Double,
                volume: Double,
                timestamp: Date,
                change24h: Double?) {
        self.symbol = symbol
        self.baseAsset = baseAsset
        self.quoteAsset = quoteAsset
        self.price = price
        self.openPrice = openPrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.volume = volume
        self.timestamp = timestamp
        self.change24h = change24h
    }
}
