//
//  ServiceManagerTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
import Alamofire
@testable import farmanet
extension farmanetTests {
    func testServiceManagerisNetworkReachableTrue() {
        let service = ServiceManager()
        let isconnect = service.isNetworkReachable()
        XCTAssertTrue(isconnect)
    }
}
