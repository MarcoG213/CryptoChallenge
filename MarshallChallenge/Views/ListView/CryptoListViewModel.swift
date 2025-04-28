//
//  CryptoListViewModel.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI
import Core
import Domain

@Observable
@MainActor
class CryptoListViewModel {
    @ObservationIgnored
    let service: CurrencyService

    var selectedFilter: FilterOption = .valueDesc
    var selectedCurrency: CryptoCurrency? = nil
    
    init(service: CurrencyService) {
        self.service = service
    }
    
    var sortedCurrencies: [CryptoCurrency] {
        switch selectedFilter {
        case .valueAsc:
            return service.currencies.sorted { $0.currentPrice < $1.currentPrice }
        case .valueDesc:
            return service.currencies.sorted { $0.currentPrice > $1.currentPrice }
        case .change24hAsc:
            return service.currencies.sorted { $0.change24h < $1.change24h }
        case .change24hDesc:
            return service.currencies.sorted { $0.change24h > $1.change24h }
        case .marketCapAsc:
            return service.currencies.sorted { $0.marketCap < $1.marketCap }
        case .marketCapDesc:
            return service.currencies.sorted { $0.marketCap > $1.marketCap }
        }
    }
}
