//
//  HTTPClientProtocol.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
protocol HTTPClientProtocol {
    func getPharmacys(url: URL, completion: @ escaping ([Pharmacy]?) -> Void)
    
}
