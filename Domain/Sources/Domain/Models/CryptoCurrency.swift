//
//  CryptoCurrency.swift
//  Domain
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public struct CryptoCurrency: Identifiable, Codable, Currency, Sendable, Hashable {
    public var id: String { symbol }

    public let symbol: String
    public let baseAsset: String
    public let quoteAsset: String
    public var price: Double
    public var openPrice: Double
    public var currentPrice: Double
    public var highPrice: Double
    public var lowPrice: Double
    public var volume: Double
    public let timestamp: Date
    public let change24h: Double
    public var marketCap: Double

    public init(symbol: String,
                baseAsset: String,
                quoteAsset: String,
                price: Double,
                openPrice: Double,
                currentPrice: Double,
                highPrice: Double,
                lowPrice: Double,
                volume: Double,
                timestamp: Date,
                change24h: Double,
                marketCap: Double) {
        self.symbol = symbol
        self.baseAsset = baseAsset
        self.quoteAsset = quoteAsset
        self.price = price
        self.openPrice = openPrice
        self.currentPrice = currentPrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
        self.volume = volume
        self.timestamp = timestamp
        self.change24h = change24h
        self.marketCap = marketCap
    }
}
