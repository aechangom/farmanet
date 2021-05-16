//
//  PharmacyCellVMTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testPharmacyCellVMinit() {
        let modelView = PharmacyViewModel(service: MockHTTPClient())
        modelView.retriveDataList()
        let pharmacyCellModel: PharmacyCellViewModel = PharmacyCellViewModel(pharmacy: modelView.pharmacyArray[0])
        let pharmacytest = modelView.getCellViewModel(index: 0)
        XCTAssertEqual(pharmacyCellModel.description, pharmacytest.description)
        XCTAssertEqual(pharmacyCellModel.localAddress, pharmacytest.localAddress)
        XCTAssertEqual(pharmacyCellModel.localName, pharmacytest.localName)
        XCTAssertEqual(pharmacyCellModel.localLocalize, pharmacytest.localLocalize)
    }
}
