//
//  SplashScreenView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI
import DesignSystem
import Core

struct SplashScreenView: View {
    @Environment(CurrencyService.self) private var service
    @Binding var isActive: Bool
    
    var body: some View {
        SplashView()
            .onAppear {
                Task {
                    await 2.0.asyncDelay()
                    await service.fetch()
                    isActive = true
                }
            }
    }
}

#Preview {
    SplashScreenView(isActive: .constant(false))
}
