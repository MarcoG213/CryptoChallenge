//
//  File.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI

public struct IconView: View {
    private let assetName: String
    private let size: CGFloat

    public init(assetName: String, size: CGFloat = 32) {
        self.assetName = assetName
        self.size = size
    }
    
    public var body: some View {
        if let uiImage = UIImage(named: assetName, in: .module, with: nil) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: size, height: size)
                .clipShape(Circle())
        } else {
            Image(systemName: "questionmark.circle")
                .resizable()
                .frame(width: size, height: size)
                .background(Color.gray)
                .clipShape(Circle())
        }
    }
}

#Preview {
    IconView(assetName: "btc")
}
