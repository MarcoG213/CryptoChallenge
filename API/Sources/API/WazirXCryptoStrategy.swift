//
//  WazirXCryptoStrategy.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation
import Domain
import NetworkLayer

public final class WazirXCryptoPriceStrategy: CurrencyStrategy {
    private let client: NetworkClientProtocol

    public init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }
    
    public func fetchCurrencies(_ type: CurrencyType) async throws -> [Currency] {
        switch type {
        case .crypto:
            return try await fetchCryptoPrices()
        default:
            throw CryptoAPIError.unsupportedCurrencyType
        }
    }

    private func fetchCryptoPrices() async throws -> [Currency] {
        let urlString = "https://api.wazirx.com/sapi/v1/tickers/24hr"
        guard let url = URL(string: urlString) else {
            throw CryptoAPIError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let raw: [RawCryptoResponse] = try await client.fetch([RawCryptoResponse].self, from: request)
        
        let coins = raw
            .filter { $0.quoteAsset.lowercased() == "usdt" }
            .compactMap { $0.make() }
        
        guard !coins.isEmpty else {
            throw CryptoAPIError.emptyResult
        }
        
        return coins
    }
}
