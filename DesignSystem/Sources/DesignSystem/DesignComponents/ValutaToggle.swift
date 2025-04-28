//
//  ValutaToggle.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI
import Core

public struct ValutaToggle: View {
    private let currentValuta: AppValuta
    private let toggleAction: () async -> Void

    public init(currentValuta: AppValuta, toggleAction: @escaping () async -> Void) {
        self.currentValuta = currentValuta
        self.toggleAction = toggleAction
    }

    public var body: some View {
        Menu {
            Button {
                Task {
                    await toggleAction()
                }
            } label: {
                Label("Switch to \(currentValuta == .usd ? "SEK" : "USD")", systemImage: "arrow.left.arrow.right")
            }
        } label: {
            HStack(spacing: 4) {
                Text(currentValuta.rawValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                +
                Text(" \(Image(systemName: "arrow.clockwise"))")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
    }
}
#Preview {
    ValutaToggle(currentValuta: .usd, toggleAction: {})
}
