//
//  PharmacyViewModel.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
class PharmacyViewModel {
    var service: HTTPClientProtocol
    init(service: HTTPClientProtocol) {
        self.service = service
    }
    
    var refreshData = { () -> Void in }
    var refreshStatus = { (_ status: Bool) -> Void in }
    var pharmacyArray: [Pharmacy] = [Pharmacy]() {
        didSet {
            refreshData()
        }
    }
    var status: Bool = true {
        didSet {
            refreshStatus(status)
        }
    }
    var numberOfCells: Int {
        return pharmacyArray.count
    }
 
    func retriveDataList() {
        guard let url = URL(string: "https://farmanet.minsal.cl/index.php/ws/getLocales")else {return}
        
        service.getPharmacys(url: url) { pharmacyList in
            
            if let pharmacyList = pharmacyList {
                self.pharmacyArray = pharmacyList
                self.status = true
                
            } else {
                self.pharmacyArray = [Pharmacy]()
                self.status = false
  
            }
        }
             
    }
    
    func getCellViewModel(index: Int) -> PharmacyCellViewModel {
        let pharmacy = self.pharmacyArray[index]
        return PharmacyCellViewModel(pharmacy: pharmacy)
    }
      
}
