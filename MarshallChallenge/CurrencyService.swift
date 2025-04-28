//
//  CurrencyService.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation
import Domain
import Core
import API

@Observable
@MainActor
class CurrencyService {
    let strategy: CurrencyStrategy
    let exchangeStrategy: ExchangeRateStrategy
    
    var currencies: [CryptoCurrency] = []
    var isLoading = false
    var error: String?

    var selectedValuta: AppValuta = .usd
    var currentExRate: Double = 1.0
    
    private var exchangeRateTask: Task<Void, Never>? = nil
    var isFetchingRate = false

    init(strategy: CurrencyStrategy = WazirXCryptoPriceStrategy()) {
        self.strategy = strategy
        self.exchangeStrategy = OpenERExchangeRateStrategy()
    }

    func fetch() async {
        isLoading = true
        do {
            let fetched = try await strategy.fetchCurrencies(.crypto) as? [CryptoCurrency] ?? []
            currencies = applyExchangeRate(to: fetched)
        } catch {
            self.error = "Failed to load: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    func toggleCurrency() async {
        selectedValuta = (selectedValuta == .usd) ? .sek : .usd
        await loadExchangeRateIfNeeded()
        await fetch()
    }
    
    public func startUpdatingExchangeRate() {
        isFetchingRate = true
        exchangeRateTask?.cancel()

        exchangeRateTask = Task {
            while !Task.isCancelled {
                do {
                    let rate = try await exchangeStrategy.fetchExchangeRate(base: "USD", target: "SEK")
                    currentExRate = rate
                    isFetchingRate = false
                } catch {
                    print("Failed to fetch exchange rate:", error)
                }
                try? await Task.sleep(nanoseconds: 5_000_000_000)
            }
        }
    }

    public func stopUpdatingExchangeRate() {
        exchangeRateTask?.cancel()
        exchangeRateTask = nil
    }
    
    private func loadExchangeRateIfNeeded() async {
        if selectedValuta == .sek {
            do {
                let rate = try await exchangeStrategy.fetchExchangeRate(base: "USD", target: "SEK")
                currentExRate = rate
            } catch {
                print("Error fetching SEK rate: \(error)")
            }
        }
    }
    
    private func applyExchangeRate(to currencies: [CryptoCurrency]) -> [CryptoCurrency] {
        currencies.map { currency in
            var adjusted = currency
            adjusted.price *= currentExRate
            adjusted.currentPrice *= currentExRate
            adjusted.openPrice *= currentExRate
            adjusted.highPrice *= currentExRate
            adjusted.lowPrice *= currentExRate
            adjusted.marketCap *= currentExRate
            adjusted.volume *= currentExRate
            return adjusted
        }
    }
}
