//
//  DataTests.swift
//  SkyKit
//
//  Created by Skylar Schipper on 1/27/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import SkyKit

class DataTests: XCTestCase {
    func testCreatingBase16() {
        let data = Data(bytes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 255])
        XCTAssertEqual(data.base16, "0102030405060708090a0b0c0d0e0f1011ff")
    }
}
