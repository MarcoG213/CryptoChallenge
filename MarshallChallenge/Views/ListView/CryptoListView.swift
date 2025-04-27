//
//  CryptoListView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import SwiftUI
import API
import DesignSystem
import Core

struct CryptoListView: View {
    @State private var model = CryptoListViewModel(strategy: WazirXCryptoPriceStrategy())
    
    var body: some View {
        List(model.currencies, id: \.symbol) { currency in
            CryptoListElement(assetName: currency.baseAsset,
                              currentValue: currency.currentPrice,
                              change24h: currency.change24h ?? 0,
                              marketCap: (currency.marketCap ?? 0).formattedMarketCap())
        }
        .task {
            await model.fetch()
        }
    }
}

#Preview {
    CryptoListView()
}
