//
//  CryptoColor.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-27.
//

import Foundation

public enum CryptoColor: String {
    case positive = "positive_green"
    case negative = "negative_red"
    
    public var name: String {
        self.rawValue
    }
}
