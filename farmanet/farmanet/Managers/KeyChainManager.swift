//
//  KeyChainManager.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/14/21.
//

import Foundation
import KeychainSwift
class KeyChainManager {
    static let shared = KeyChainManager()
    let keychain = KeychainSwift()
    
    func setValue(value: Data, with key: String) {
        keychain.set(value, forKey: key)
    }
   
    func getValue(for key: String) -> Data? {
        keychain.getData(key)
    }
   
}
