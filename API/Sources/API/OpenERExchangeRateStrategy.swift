//
//  OpenERExchangeRateStrategy.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation
import Domain
import NetworkLayer

public final class OpenERExchangeRateStrategy: ExchangeRateStrategy {
    private let client: NetworkClientProtocol

    public init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    public func fetchExchangeRate(base: String, target: String) async throws -> Double {
        let baseCode = base.uppercased()
        let targetCode = target.uppercased()
        let urlString = "https://open.er-api.com/v6/latest/\(baseCode)"
        
        guard let url = URL(string: urlString) else {
            throw ForexError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let response = try await client.fetch(OpenERAPIResponse.self, from: request)
        
        guard let rate = response.conversionRates[targetCode] else {
            throw ForexError.missingRate(targetCode)
        }
        
        return rate
    }
}
