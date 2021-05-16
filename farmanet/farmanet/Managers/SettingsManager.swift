//
//  SettingsManager.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/14/21.
//

import Foundation
class SettingsManager {
    static let shared = SettingsManager()
    let user = "admin"
    let password = "12345"
    var loginUser = ""
    let key = "key"
    let passKey = "pass"
    let userKey = "user"
    
    func saveData() {
     let key = CryptoManager().generateKey()
        KeyChainManager.shared.setValue(value: key, with: self.key)
        if let passwordData: Data = password.data(using: .utf8) {
            if let encryptedpass = CryptoManager().setDatatoEncypt(data: passwordData, key: key) {
                KeyChainManager.shared.setValue(value: encryptedpass, with: self.passKey)
                
            }
        }
        if let userData = user.data(using: .utf8) {
            if let encrypteduser = CryptoManager().setDatatoEncypt(data: userData, key: key) {
                KeyChainManager.shared.setValue(value: encrypteduser, with: self.userKey)
            }
        }
             
    }
    init() {}
}
