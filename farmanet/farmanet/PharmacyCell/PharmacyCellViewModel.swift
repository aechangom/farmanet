//
//  PharmacyCellViewModel.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
class PharmacyCellViewModel {
    let pharmacy: Pharmacy
    
    init(pharmacy: Pharmacy ) {
        self.pharmacy = pharmacy
    }
    var localName: String {
        return pharmacy.localName
    }
    var localAddress: String {
        return pharmacy.localAddress
    }
    var localLocalize: String {
        return pharmacy.localidadName
    }
    var description: String {
        return self.convertPharmacyToString(pharmacy: pharmacy)
    }
    func convertPharmacyToString(pharmacy: Pharmacy) -> String {
        var resultado: String = ""
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(pharmacy)

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                resultado = jsonString
            }
        } catch {
            print(error.localizedDescription)
            resultado = MessageText.shared.errorConversion
        }
        return resultado
    }

}
