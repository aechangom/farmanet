//
//  CryptoManager.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/14/21.
//

import Foundation
import CryptoKit

class CryptoManager {
    
    func generateKey() -> Data {
        let key = SymmetricKey(size: .bits256)
        let keyb64 = key.withUnsafeBytes {
            return Data(Array($0))        }
        return keyb64
    }
    
    func setDatatoEncypt(data: Data, key: Data) -> Data? {
        let key2 = SymmetricKey(data: key)
        if let sealBoxDta = try? AES.GCM.seal(data, using: key2).combined {
            return sealBoxDta
        } else {
            print("error")
            return nil
        }
    }
    
    func getDecryptData(data: Data, key: Data) -> Data? {
        let key2 = SymmetricKey(data: key)
        if let sealedBox = try? AES.GCM.SealedBox(combined: data) {
            return self.getDataFromCrypto(sealedBox: sealedBox, key: key2)
            
        } else {
            return nil
        }
        
    }
    
    func getDataFromCrypto(sealedBox: AES.GCM.SealedBox, key: SymmetricKey) -> Data? {
        if let decryptedData = try? AES.GCM.open(sealedBox, using: key) {
            return decryptedData
        } else {
            return nil
        }
    }
    
}
