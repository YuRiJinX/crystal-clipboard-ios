//
//  ProviderTestCase.swift
//  CrystalClipboardTests
//
//  Created by Justin Mazzocchi on 9/7/17.
//  Copyright © 2017 Justin Mazzocchi. All rights reserved.
//

import XCTest

class ProviderTestCase: DataTestCase {
    var provider: TestAPIProvider!
    
    override func setUp() {
        super.setUp()
        provider = TestAPIProvider(testData: testData)
    }
    
    override func tearDown() {
        provider = nil
        super.tearDown()
    }
}
