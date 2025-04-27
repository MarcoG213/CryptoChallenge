//
//  RawCryptoResponse.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation
import Domain

public struct RawCryptoResponse: Decodable {
    public let symbol: String
    public let baseAsset: String
    public let quoteAsset: String
    public let openPrice: String
    public let lowPrice: String
    public let highPrice: String
    public let lastPrice: String
    public let volume: String
    public let bidPrice: String
    public let askPrice: String
    public let at: TimeInterval
}

extension RawCryptoResponse {
    public func make() -> CryptoCurrency? {
        guard
            let open = Double(openPrice),
            let high = Double(highPrice),
            let low = Double(lowPrice),
            let vol = Double(volume),
            open != 0
        else { return nil }

        // Simulate a small price change (±5%)
        let changeFactor = Double.random(in: -0.05...0.05)
        let last = open * (1.0 + changeFactor)
        
        let marketCap = Double.randomMarketCap(for: open)
        
        let change24h = ((last - open) / open) * 100
        let timestamp = Date(timeIntervalSince1970: at / 1000)

        return CryptoCurrency(
            symbol: symbol,
            baseAsset: baseAsset,
            quoteAsset: quoteAsset,
            price: last,
            openPrice: open,
            currentPrice: last,
            highPrice: high,
            lowPrice: low,
            volume: vol,
            timestamp: timestamp,
            change24h: change24h,
            marketCap: marketCap
        )
    }
}

fileprivate extension Double {
    static func randomMarketCap(for price: Double) -> Double {
        let multiplier: Double

        switch price {
        case 10000...:
            multiplier = Double.random(in: 10_000_000...100_000_000)
        case 1000..<10000:
            multiplier = Double.random(in: 1_000_000...10_000_000)
        case 10..<1000:
            multiplier = Double.random(in: 100_000...1_000_000)
        default:
            multiplier = Double.random(in: 10_000...100_000)
        }

        return price * multiplier
    }
}
