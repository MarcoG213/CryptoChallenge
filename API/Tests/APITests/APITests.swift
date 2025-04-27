import XCTest
@testable import API

final class APITests: XCTestCase {
    func testParseAndMapCryptoCurrency() throws {
        let data = try loadFixture(.crypto)
        let raw = try JSONDecoder().decode([RawCryptoResponse].self, from: data)
        let mapped = raw.compactMap { $0.make() }
        
        XCTAssertEqual(mapped.count, 1)
        XCTAssertEqual(mapped[0].baseAsset, "btc")
    }
    
    func testParsingExchangeRateResponse() throws {
        let data = try loadFixture(.exchange)
        let decoded = try JSONDecoder().decode(OpenERAPIResponse.self, from: data)

        XCTAssertEqual(decoded.result, "success")
        XCTAssertEqual(decoded.conversionRates["SEK"], 10.43)
    }
    
    private func loadFixture(_ fixture: FixtureType) throws -> Data {
        guard let url = Bundle.module.url(
            forResource: fixture.fileName,
            withExtension: fixture.fileExtension
        ) else {
            XCTFail("Fixture \(fixture.fileName).json not found")
            throw NSError(domain: "Missing fixture", code: 1)
        }
        return try Data(contentsOf: url)
    }
}

