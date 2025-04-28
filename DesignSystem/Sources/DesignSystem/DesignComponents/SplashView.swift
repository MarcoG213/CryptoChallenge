//
//  SplashView.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI

public struct SplashView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Spacer()
            if let uiImage = UIImage(named: "bitcoin_logo", in: .module, with: nil) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 256, height: 256)
            }
            HStack {
                if let uiImage = UIImage(named: "dollar_coin", in: .module, with: nil) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 128, height: 128)
                }
                if let uiImage = UIImage(named: "left_right", in: .module, with: nil) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 64, height: 64)
                }
                if let uiImage = UIImage(named: "krona", in: .module, with: nil) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 128, height: 128)
                }
            }
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

#Preview {
    SplashView()
}
