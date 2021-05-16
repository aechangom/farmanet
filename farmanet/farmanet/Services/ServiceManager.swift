//
//  ServiceManager.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/14/21.
//

import Foundation
import Alamofire

class ServiceManager: HTTPClientProtocol {

    let networkReachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    func isNetworkReachable() -> Bool {
        return networkReachabilityManager?.isReachable ?? false
    }
    
    func getPharmacys(url: URL, completion: @ escaping ([Pharmacy]?) -> Void) {
        print(self.isNetworkReachable())
        if self.isNetworkReachable() {
        AF.request(url).response { response in
                if let data = response.data {
                    do {
                        let localList = try JSONDecoder().decode([Pharmacy].self, from: data)
                        completion(localList)

                    } catch let err {
                        print(err.localizedDescription)
                        completion(nil)
                    }
                }
            }
        } else {
            completion(nil)
        }
        }
     
}
