//
//  CoinDetailView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI
import Core
import Domain
import DesignSystem
import Charts

struct CoinDetail: View {
    let currency: CryptoCurrency
    let valuta: AppValuta
    
    var body: some View {
        CoinDetailView(assetName: currency.baseAsset,
                       change24h: currency.change24h,
                       currentPrice: currency.currentPrice,
                       openPrice: currency.openPrice,
                       marketCap: currency.marketCap,
                       valuta: valuta)
    }
}

#Preview {
    CoinDetail(currency: CryptoCurrency(symbol: "btcusdt",
                                            baseAsset: "btc",
                                            quoteAsset: "usdt",
                                            price: 0,
                                            openPrice: 0,
                                            currentPrice: 0,
                                            highPrice: 0,
                                            lowPrice: 0,
                                            volume: 0,
                                            timestamp: Date(),
                                            change24h: 0,
                                            marketCap: 0),
               valuta: .usd)
}
