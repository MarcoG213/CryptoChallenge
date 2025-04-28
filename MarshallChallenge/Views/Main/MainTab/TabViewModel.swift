//
//  TabViewModel.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-27.
//

import Foundation

@Observable
@MainActor
class TabViewModel {
    enum Tab: Int {
        case list = 0
        case comparison
        case liveRate
    }
    
    var selectedTab = 0
    var tabs: [Tab] = [.list, .comparison, .liveRate]
    
    init() {}
    
}

extension TabViewModel.Tab: Identifiable {
    var id: Int { rawValue }

    var title: String {
        switch self {
        case .list:
            "Currencies"
        case .comparison:
            "Compare"
        case .liveRate:
            "Live Rate"
        }
    }

    func icon() -> String {
        switch self {
        case .list:
            "bitcoinsign.circle.fill"
        case .comparison:
            "arrow.left.arrow.right.circle"
        case .liveRate:
            "dot.radiowaves.left.and.right"
        }
    }
}
