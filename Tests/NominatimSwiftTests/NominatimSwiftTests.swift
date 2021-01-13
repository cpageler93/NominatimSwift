//
//  NominatimSwiftTests.swift
//  NominatimSwiftTests
//
//  Created by Christoph Pageler on 13.01.21.
//


import XCTest
@testable import NominatimSwift


final class NominatimSwiftTests: XCTestCase {

    func testSearch() {
        let searchExpectation = expectation(description: "search")
        let nominatim = NominatimSwift()
        nominatim.search(SearchOptions(street: "Breite Str. 36",
                                       city: "Berlin",
                                       postalCode: "10178",
                                       country: "Germany"))
        { result in
            searchExpectation.fulfill()

            XCTAssertNotNil(result)
            guard let latString = result?.first?.lat, let lat = Double(latString) else {
                XCTFail("lat nil or not double")
                return
            }
            guard let lonString = result?.first?.lon, let lon = Double(lonString) else {
                XCTFail("lon nil or not double")
                return
            }
            XCTAssertEqual(lat, 52.515, accuracy: 0.001)
            XCTAssertEqual(lon, 13.404, accuracy: 0.001)
            XCTAssertEqual(result?.first?.category, "amenity")
            XCTAssertEqual(result?.first?.type, "library")
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    static var allTests = [
        ("testSearch", testSearch),
    ]
}
