//
//  FQ_Map_ProjectTests.swift
//  FQ-Map-ProjectTests
//
//  Created by Liana Norman on 11/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import XCTest
@testable import FQ_Map_Project

class FQ_Map_ProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Private Methods
    private func getVenueDataFromJSON() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        guard let pathToData = testBundle.path(forResource: "Venues", ofType: "json") else {
            XCTFail("Couldn't find JSON")
            return nil
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("Couldn't find data in json file: \(jsonError)")
        }

 }
    
    // MARK: - Unit Tests
    func testLoadVenues() {
        let data = getVenueDataFromJSON() ?? Data()
        let venues = Welcome.decodeVenues(from: data) ?? []
        XCTAssertTrue(venues.count > 0, "No venues were loaded")
    }
    
}
