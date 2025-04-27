//
//  CryptoAPIError.swift
//  API
//
//  Created by MarcoG on 2025-04-25.
//

import Foundation

public enum CryptoAPIError: Error, Equatable {
    case invalidURL
    case decodingFailure
    case unsupportedQuoteAsset(String)
    case unsupportedCurrencyType
    case emptyResult
    case unknown
}
