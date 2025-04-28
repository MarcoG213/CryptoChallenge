//
//  LiveRateView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI
import DesignSystem

struct LiveRateView: View {
    @Environment(CurrencyService.self) private var service
    
    var rate: Double {
        switch service.selectedValuta {
        case .usd: service.currentExRate
        case .sek: 1 / service.currentExRate
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(service.selectedValuta == .usd
                     ? "USD ➔ SEK"
                     : "SEK ➔ USD"
                )
                .font(.largeTitle)
                .bold()
                
                if !service.isFetchingRate {
                    Text(rate.description)
                        .font(.title2)
                        .foregroundColor(.secondary)
                } else {
                    ProgressView()
                }
            }
            .padding()
            .navigationTitle("Live Rate")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ValutaToggle(currentValuta: service.selectedValuta,
                                 toggleAction: {
                        Task { await service.toggleCurrency() }
                    })
                }
            }
        }
        .onAppear {
            service.startUpdatingExchangeRate()
        }
        .onDisappear {
            service.stopUpdatingExchangeRate()
        }
    }
}

#Preview {
    LiveRateView()
}
