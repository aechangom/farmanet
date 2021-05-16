//
//  LoginVCTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/16/21.
//
import XCTest
@testable import farmanet
extension farmanetTests {
    func testIsNotNilAfterViewDidLoad() {
        let view = LoginViewController()
        XCTAssertNotNil(view.view)
    }
    func testLoginVCgoNextView() {
        let view = LoginViewController()
        view.goToNextView()
        XCTAssertNotNil(view.view)
    }
}
