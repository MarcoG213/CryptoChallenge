//
//  CoinDetailView.swift
//  DesignSystem
//
//  Created by MarcoG on 2025-04-28.
//

import SwiftUI
import Core
import Charts

public struct CoinDetailView: View {
    let assetName: String
    let change24h: Double
    let currentPrice: Double
    let openPrice: Double
    let marketCap: Double
    let valuta: AppValuta
    
    @State private var dataPoints: [ChartPoint] = []
    
    public init(assetName: String,
                change24h: Double,
                currentPrice: Double,
                openPrice: Double,
                marketCap: Double,
                valuta: AppValuta) {
        self.assetName = assetName
        self.change24h = change24h
        self.currentPrice = currentPrice
        self.openPrice = openPrice
        self.marketCap = marketCap
        self.valuta = valuta
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                IconView(assetName: assetName, size: 64)
                VStack(alignment: .leading) {
                    Text(assetName.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(change24h.plusMinusFormatted)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(change24h >= 0
                                         ? Color.positive
                                         : Color.negative
                        )
                }
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("Current price: ".uppercased())
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(valutaSymbol()) " + String(format: "%.2f", currentPrice))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(change24h >= 0
                                         ? Color.positive
                                         : Color.negative
                        )
                    Spacer()
                }
                
                HStack {
                    Text("Opening price: ".uppercased())
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(valutaSymbol()) " + String(format: "%.2f", openPrice))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
            }
            .padding(.top, 30)
            
            HStack {
                Text("Market Cap: ".uppercased())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("\(valutaSymbol()) " + marketCap.formattedMarketCap())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top, 30)
            
            VStack {
                HStack {
                    Text("24 HOURS TREND")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                if !dataPoints.isEmpty {
                    Chart(dataPoints) { point in
                        LineMark(
                            x: .value("Time", point.time),
                            y: .value("Price", point.value)
                        )
                    }
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .hour, count: 4)) { value in
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.hour().minute())
                        }
                    }
                    .frame(height: 200)
                    .padding()
                } else {
                    ProgressView()
                        .frame(height: 200)
                }
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .task {
            generateChartData()
        }
    }
    
    private func valutaSymbol() -> String {
        switch valuta {
        case .usd: "$"
        case .sek: "SEK"
        }
    }
    
    private func generateChartData() {
        var points: [ChartPoint] = []
        
        let start = openPrice
        let end = currentPrice
        let steps = 20
        let now = Date()
        
        for i in 0..<steps {
            let progress = Double(i) / Double(steps)
            let interpolated = start + (end - start) * progress
            let noise = Double.random(in: -0.1...0.1) * start
            
            let timeOffset = TimeInterval(-3600 * (steps - i)) // go backwards in hours
            let pointTime = Calendar.current.date(byAdding: .second, value: Int(timeOffset), to: now) ?? now
            
            points.append(ChartPoint(value: interpolated + noise, time: pointTime))
        }
        
        self.dataPoints = points
    }
}

#Preview {
    CoinDetailView(assetName: "btc",
                   change24h: 0,
                   currentPrice: 0,
                   openPrice: 0,
                   marketCap: 0,
                   valuta: .usd)
}
