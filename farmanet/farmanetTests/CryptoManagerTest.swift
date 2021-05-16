//
//  CryptoManagerTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testCryptoMaganersetDatatoEncyptError() {
        let crypto = CryptoManager()
        let data = Data()
        let result = crypto.setDatatoEncypt(data: data, key: data)
        XCTAssertNil(result)
    }
    func testCryptoMaganergetDecryptDataError() {
        let crypto = CryptoManager()
        let data = Data()
        let result = crypto.getDecryptData(data: data, key: data)
        XCTAssertNil(result)
    }
}
