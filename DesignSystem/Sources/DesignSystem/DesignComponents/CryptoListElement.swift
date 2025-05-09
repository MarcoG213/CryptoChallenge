//
//  CryptoListElement.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI
import Core

public struct CryptoListElement: View {
    private let assetName: String
    private let currentValue: Double
    private let change24h: Double
    private let marketCap: String
    private let valuta: AppValuta
    
    public init(assetName: String,
                currentValue: Double,
                change24h: Double,
                marketCap: String,
                valuta: AppValuta) {
        self.assetName = assetName
        self.currentValue = currentValue
        self.change24h = change24h
        self.marketCap = marketCap
        self.valuta = valuta
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            IconView(assetName: assetName,
                     size: 32)
            .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 4) {
                Text(assetName.uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 8)
                HStack {
                    HStack {
                        Text("\(valutaSymbol()) " + String(format: "%.2f", currentValue))
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(change24h >= 0
                                             ? Color.positive
                                             : Color.negative
                            )
                        Spacer()
                    }
                    .frame(width: 110)
                    .padding(.leading, 8)
                    
                    Text(change24h.plusMinusFormatted)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(change24h >= 0
                                         ? Color.positive
                                         : Color.negative
                        )
                        .frame(width: 60)
                    
                    Text("\(valutaSymbol()) " + marketCap)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .frame(width: 120)
                    
                }
            }
        }
    }
    
    private func valutaSymbol() -> String {
        switch valuta {
        case .usd: "$"
        case .sek: "SEK"
        }
    }
}

#Preview {
    CryptoListElement(assetName: "btc",
                      currentValue: 6308934.4765,
                      change24h: 2.4,
                      marketCap: "$76.3456B",
                      valuta: .usd)
}
