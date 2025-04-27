//
//  CryptoListViewModel.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation
import Domain
import API

@Observable
@MainActor
class CryptoListViewModel {
    var currencies: [CryptoCurrency] = []
    var isLoading = false
    var error: String?

    let strategy: CurrencyStrategy

    init(strategy: CurrencyStrategy) {
        self.strategy = strategy
    }

    func fetch() async {
        isLoading = true
        do {
            currencies = try await strategy.fetchCurrencies(.crypto) as? [CryptoCurrency] ?? []
        } catch {
            self.error = "Failed to load: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
