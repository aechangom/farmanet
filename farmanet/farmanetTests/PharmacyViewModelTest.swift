//
//  PharmacyViewModelTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testPharmacyViewModelInit() {
        let modelView = PharmacyViewModel(service: MockHTTPClient())
        XCTAssertNotNil(modelView)
    }
    func testPharmacyViewModelvardiSet() {
        let status = true
        let arrayTest = [Pharmacy]()
        let modelView = PharmacyViewModel(service: MockHTTPClient())
        modelView.status = status
        modelView.pharmacyArray = arrayTest
        XCTAssertTrue(modelView.status)
        XCTAssertNotNil(modelView.pharmacyArray)
    }
    func testPharmacyViewModelnumberOdCells() {
        let modelView = PharmacyViewModel(service: MockHTTPClient())
        modelView.retriveDataList()
        XCTAssertEqual(modelView.numberOfCells, 15)
    }
    
    func testPharmacyViewModelCellViewModel() {
        let modelView = PharmacyViewModel(service: MockHTTPClient())
        modelView.retriveDataList()
        let pharmacyCellModel: PharmacyCellViewModel = PharmacyCellViewModel(pharmacy: modelView.pharmacyArray[0])
        let pharmacytest = modelView.getCellViewModel(index: 0)
        XCTAssertEqual(pharmacyCellModel.description, pharmacytest.description)
    }
    func testPharmacyViewModelretriveDataError() {
        let service = MockHTTPClient()
        service.isErrorFlag = true
        let modelView = PharmacyViewModel(service: service)
        modelView.retriveDataList()
        XCTAssertFalse(modelView.status)
    }
}
