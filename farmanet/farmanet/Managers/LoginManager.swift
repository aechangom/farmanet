//
//  LoginManager.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/14/21.
//

import Foundation
class LoginManager {
    var passKey: String
    var userKey: String
    init(userKey: String, passKey: String) {
        self.passKey = passKey
        self.userKey = userKey
    }
    func validateLogin(with username: String, and password: String) -> Bool {
        if let user = self.getDatafromKechain(by: self.userKey),
           let pass = self.getDatafromKechain(by: self.passKey) {
            return user == username && pass == password
        } else {
            return false
        }
    }
 
    func getDatafromKechain(by key: String) -> String? {
        if let data = KeyChainManager.shared.getValue(for: key),
           let key = KeyChainManager.shared.getValue(for: SettingsManager.shared.key) {
            return self.decryptDataForm(data: data, key: key)
        } else {
            return nil
        }
    }
    
    func decryptDataForm(data: Data, key: Data) -> String? {
        if let decryptedData = CryptoManager().getDecryptData(data: data, key: key) {
            return String(decoding: decryptedData, as: UTF8.self)
        } else {
            return nil
        }
    }
}
