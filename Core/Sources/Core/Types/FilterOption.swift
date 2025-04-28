//
//  FilterOption.swift
//  Core
//
//  Created by MarcoG on 2025-04-28.
//

import Foundation

public enum FilterOption : String, CaseIterable {
    case valueAsc
    case valueDesc
    case change24hAsc
    case change24hDesc
    case marketCapAsc
    case marketCapDesc
    
    public var isAscending: Bool {
        switch self {
        case .valueAsc, .change24hAsc, .marketCapAsc:
            return true
        default:
            return false
        }
    }
    
    public var baseOption: Self {
        switch self {
        case .valueAsc, .valueDesc: return .valueDesc
        case .change24hAsc, .change24hDesc: return .change24hDesc
        case .marketCapAsc, .marketCapDesc: return .marketCapDesc
        }
    }
    
    public func toggled() -> FilterOption {
        switch self {
        case .valueAsc: return .valueDesc
        case .valueDesc: return .valueAsc
        case .change24hAsc: return .change24hDesc
        case .change24hDesc: return .change24hAsc
        case .marketCapAsc: return .marketCapDesc
        case .marketCapDesc: return .marketCapAsc
        }
    }
}
