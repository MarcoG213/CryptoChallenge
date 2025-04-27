//
//  CryptoListView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import SwiftUI
import API

struct CryptoListView: View {
    @State private var model = CryptoListViewModel(strategy: WazirXCryptoPriceStrategy())
    
    var body: some View {
        List(model.currencies, id: \.symbol) { currency in
            HStack {
                Text(currency.symbol.uppercased())
                Spacer()
                Text(String(format: "%.2f", currency.change24h ?? 0.0))
            }
        }
        .task {
            await model.fetch()
        }
    }
}

#Preview {
    CryptoListView()
}
