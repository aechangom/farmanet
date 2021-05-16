//
//  PharmacyDetailViewModelTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testPharmacyDeatilVMInit() {
        let detail = "test"
        let detailVM = PharmacyDetailViewModel(detail: detail)
        XCTAssertEqual(detail, detailVM.detail)
    }
}
