//
//  TimeInterval+Extensions.swift
//  Core
//
//  Created by MarcoG on 2025-04-27.
//

import Foundation

public extension TimeInterval {
    func asyncDelay() async {
        let nanoseconds = UInt64(self * 1_000_000_000)
        try? await Task.sleep(nanoseconds: nanoseconds)
    }
}
