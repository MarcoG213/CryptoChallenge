//
//  CryptoTabView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-27.
//

import SwiftUI

struct CryptoTabView: View {
    @State private var vm: TabViewModel = .init()
    @Environment(CurrencyService.self) private var service
    
    var body: some View {
        NavigationView {
            TabView(selection: $vm.selectedTab) {
                ForEach(vm.tabs) { tab in
                    view(for: tab)
                        .tabItem {
                            customTabItem(tab,
                                          isActive: vm.selectedTab == tab.rawValue)
                        }
                        .tag(tab.rawValue)
                }
            }
            .tint(Color.red)
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    private func view(for tab: TabViewModel.Tab) -> some View {
        switch tab {
        case .list:
            CryptoListView(vm: CryptoListViewModel(service: service))
        case .comparison: ComparisonView()
        case .liveRate: LiveRateView()
        }
    }
    
    @ViewBuilder
    private func customTabItem(_ item: TabViewModel.Tab, isActive: Bool) -> some View {
        VStack(spacing: 0) {
            Image(systemName: item.icon())
            Text(item.title)
                .foregroundStyle(isActive ? Color.blue : Color.gray)
        }
    }
}

#Preview {
    CryptoTabView()
}
