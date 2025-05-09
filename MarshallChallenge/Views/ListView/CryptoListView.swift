//
//  CryptoListView.swift
//  MarshallChallenge
//
//  Created by MarcoG on 2025-04-25.
//

import SwiftUI
import API
import DesignSystem
import Core

struct CryptoListView: View {
    @State var vm: CryptoListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack(spacing: 12, pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(vm.sortedCurrencies, id: \.symbol) { currency in
                                Button {
                                    vm.selectedCurrency = currency
                                } label: {
                                    CryptoListElement(assetName: currency.baseAsset,
                                                      currentValue: currency.currentPrice,
                                                      change24h: currency.change24h,
                                                      marketCap: currency.marketCap.formattedMarketCap(),
                                                      valuta: vm.service.selectedValuta
                                    )
                                    .cardStyle(backgroundColor: Color.mainBG)
                                }
                                .buttonStyle(.plain)
                            }
                        } header: {
                            FilterBar(selectedFilter: $vm.selectedFilter)
                                .background(.clear)
                        }
                    }
                    .padding(.top, 12)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Text("Currencies"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ValutaToggle(currentValuta: vm.service.selectedValuta,
                                 toggleAction: {
                        Task { await vm.service.toggleCurrency() }
                    })
                }
            }
            .navigationDestination(item: $vm.selectedCurrency) { currency in
                CoinDetail(currency: currency, valuta: vm.service.selectedValuta)
            }
        }
    }
}

#Preview {
    CryptoListView(vm: CryptoListViewModel(service: CurrencyService(strategy: WazirXCryptoPriceStrategy())))
}
