//
//  ChartPoint.swift
//  Domain
//
//  Created by MarcoG on 2025-04-28.
//

import Foundation

public struct ChartPoint: Identifiable {
    public let id = UUID()
    public let time: Date
    public let value: Double
    
    public init(value: Double, time: Date) {
        self.value = value
        self.time = time
    }
}
