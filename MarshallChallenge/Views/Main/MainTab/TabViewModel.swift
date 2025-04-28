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
        case liveRate
    }
    
    var selectedTab = 0
    var tabs: [Tab] = [.list, .liveRate]
    
    init() {}
    
}

extension TabViewModel.Tab: Identifiable {
    var id: Int { rawValue }

    var title: String {
        switch self {
        case .list:
            "Currencies"
        case .liveRate:
            "Live Rate"
        }
    }

    func icon() -> String {
        switch self {
        case .list:
            "bitcoinsign.circle.fill"
        case .liveRate:
            "dot.radiowaves.left.and.right"
        }
    }
}
