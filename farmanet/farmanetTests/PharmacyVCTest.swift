//
//  PharmacyVCTest.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/16/21.
//

import XCTest
@testable import farmanet
extension farmanetTests {
    func testPharmacyIsNotNilAfterViewDidLoad() {
        let view = PharmacyViewController()
        XCTAssertNotNil(view.view)    
        let pharmacyTableVC = PharmacyViewController(nibName: "PharmacyViewController", bundle: nil)
        pharmacyTableVC.loadViewIfNeeded()
        XCTAssertNotNil(pharmacyTableVC.tableView)

    }
    func testPharmacyDetailIsNotNilAfterViewDidLoad() {
        let viewModel = PharmacyDetailViewModel(detail: "test")
        let view = PharmacyDetailViewController()
        view.viewModel = viewModel
        XCTAssertNotNil(view.view)
    }
    func testPharmacyDetailCellIsNotNilAfterViewDidLoad() {
        let view = PharmacyTableViewCell()
        XCTAssertNotNil(view.awakeFromNib())
    }
}
