//
//  CryptoColor.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI

public extension Color {
    static var positive: Color {
        Color("positive_green", bundle: .module)
    }

    static var negative: Color {
        Color("negative_red", bundle: .module)
    }
    
    static var mainBG: Color {
        Color("mainBG", bundle: .module)
    }
}
