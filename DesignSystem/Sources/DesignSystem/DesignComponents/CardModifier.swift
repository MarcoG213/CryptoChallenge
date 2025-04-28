//
//  CardModifier.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI

public struct CardModifier: ViewModifier {
    private let cornerRadius: CGFloat
    private let shadowRadius: CGFloat
    private let backgroundColor: Color

    public init(
        cornerRadius: CGFloat = 12,
        shadowRadius: CGFloat = 4,
        backgroundColor: Color = .white
    ) {
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.backgroundColor = backgroundColor
    }

    public func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .shadow(color: .black.opacity(0.1), radius: shadowRadius, x: 0, y: 2)
            )
    }
}
