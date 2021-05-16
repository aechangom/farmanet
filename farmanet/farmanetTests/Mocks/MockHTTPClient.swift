//
//  MockHTTPClient.swift
//  farmanetTests
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
@testable import farmanet

class MockHTTPClient: HTTPClientProtocol {

    var isErrorFlag = false

    func getPharmacys(url: URL, completion: @escaping ([Pharmacy]?) -> Void) {
        if isErrorFlag {
            return completion(nil)
        } else {
            guard let url = Bundle(for: MockHTTPClient.self).url(forResource: "localResponse", withExtension: "json"),
                  let data = try? Data(contentsOf: url)
            else {
                return completion(nil)
            }
            guard let pharmacyList = try? JSONDecoder().decode([Pharmacy].self, from: data)
            else {
                return completion(nil)
            }
            completion(pharmacyList)
        }
    }
}
