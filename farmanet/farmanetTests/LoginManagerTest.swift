//
//  LoginManagerTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testLoginManagergetDatafromKechainError() {
        let loginManager = LoginManager(userKey: "test", passKey: "test")
        let result = loginManager.getDatafromKechain(by: "error")
        XCTAssertNil(result)
    }
    func testLoginManagervalidateLoginError() {
        let user = "admin"
        let pass = "12345"
        let loginManager = LoginManager(userKey: "test", passKey: "test")
        let result = loginManager.validateLogin(with: user, and: pass)
        XCTAssertFalse(result)
    }
    func testLoginManagerdecryptDataForm() {
        let loginManager = LoginManager(userKey: "test", passKey: "test")
        let data = Data()
        let key = Data()
        let result = loginManager.decryptDataForm(data: data, key: key)
        XCTAssertNil(result)
    }
}
