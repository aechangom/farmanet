//
//  LoginViewModelTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testLoginViewModel() {
        let userName = "admin"
        let pass = "12345"
        let loginVM = LoginViewModel()
        XCTAssertNotNil(loginVM)
        loginVM.authenticateUserWith(userName, andPassword: pass)
        XCTAssertEqual(loginVM.user.username, userName)
    }
    func testLoginViewModelError() {
        let userName = "admin"
        let pass = "1234"
        let loginVM = LoginViewModel()
        XCTAssertNotNil(loginVM)
        loginVM.authenticateUserWith(userName, andPassword: pass)
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            if status {
                XCTAssertEqual(loginVM.user.username, userName)
            } else {
                XCTAssertEqual(loginVM.user.username, "")
            }
        }
    }
    func testLoginViewModelEmptyUser() {
        let userName = ""
        let pass = "123"
        let loginVM = LoginViewModel()
        XCTAssertNotNil(loginVM)
        loginVM.authenticateUserWith(userName, andPassword: pass)
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            if status {
                XCTAssertEqual(loginVM.user.username, userName)
            } else {
                XCTAssertEqual(loginVM.user.username, "")
            }
        }
    }
    func testLoginViewModelEmptyPassword() {
        let userName = "123"
        let pass = ""
        let loginVM = LoginViewModel()
        XCTAssertNotNil(loginVM)
        loginVM.authenticateUserWith(userName, andPassword: pass)
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            if status {
                XCTAssertEqual(loginVM.user.username, userName)
            } else {
                XCTAssertEqual(loginVM.user.password, "")
            }
        }
    }

}
