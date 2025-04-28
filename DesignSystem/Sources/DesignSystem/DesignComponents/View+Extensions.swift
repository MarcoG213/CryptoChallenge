//
//  View+Extensions.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI

public extension View {
    func cardStyle(
        cornerRadius: CGFloat = 12,
        shadowRadius: CGFloat = 4,
        backgroundColor: Color = .white
    ) -> some View {
        self.modifier(CardModifier(
            cornerRadius: cornerRadius,
            shadowRadius: shadowRadius,
            backgroundColor: backgroundColor
        ))
    }
}
