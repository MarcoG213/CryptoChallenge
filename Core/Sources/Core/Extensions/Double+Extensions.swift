//
//  File.swift
//  Core
//
//  Created by MarcoG on 2025-04-27.
//

import Foundation

public extension Double {
    var plusMinusFormatted: String {
        (self >= 0 ? "+" : "") + String(format: "%.2f", self) + "%"
    }
    
    func formattedMarketCap() -> String {
        let trillion = 1_000_000_000_000.0
        let billion = 1_000_000_000.0
        let million = 1_000_000.0
        let thousand = 1_000.0

        switch self {
        case trillion...:
            return String(format: "$%.2fT", self / trillion)
        case billion...:
            return String(format: "$%.2fB", self / billion)
        case million...:
            return String(format: "$%.2fM", self / million)
        case thousand...:
            return String(format: "$%.2fK", self / thousand)
        default:
            return String(format: "$%.2f", self)
        }
    }
}
