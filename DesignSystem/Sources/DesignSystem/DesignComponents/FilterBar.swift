//
//  FilterBar.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI
import Core

public struct FilterBar: View {
    @Binding var selectedFilter: FilterOption
    
    public init(selectedFilter: Binding<FilterOption>) {
        self._selectedFilter = selectedFilter
    }

    public var body: some View {
            HStack(spacing: 12) {
                ForEach([FilterOption.valueDesc, .change24hDesc, .marketCapDesc], id: \.self) { option in
                    Button {
                        if selectedFilter.baseOption == option.baseOption {
                            selectedFilter = selectedFilter.toggled()
                        } else {
                            selectedFilter = option
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text(option.title)
                                .font(.caption)
                                .fontWeight(.semibold)

                            if selectedFilter.baseOption == option.baseOption {
                                Image(systemName: selectedFilter.isAscending ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                                    .font(.caption2.bold())
                            } else {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .font(.caption2.bold())
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectedFilter.baseOption == option.baseOption ? .black : Color.gray.opacity(0.2))
                        )
                        .foregroundColor(selectedFilter.baseOption == option.baseOption ? .white : .gray)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
}

fileprivate extension FilterOption {
    var title: String {
        switch self {
        case .valueAsc, .valueDesc:
            return "Value"
        case .change24hAsc, .change24hDesc:
            return "24h Change"
        case .marketCapAsc, .marketCapDesc:
            return "Market Cap"
        }
    }
}
