//
//  ContentView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import SwiftUI
import API
import Domain

struct ContentView: View {
    @State private var isActive = false
    @State private var currencyService = CurrencyService()
    
    var body: some View {
        if isActive {
            CryptoTabView()
                .environment(currencyService)
        } else {
            SplashScreenView(isActive: $isActive)
                .environment(currencyService)
        }
    }
}

#Preview {
    ContentView()
}
