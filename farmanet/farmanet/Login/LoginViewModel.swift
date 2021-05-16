//
//  LoginViewModel.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import Foundation
class LoginViewModel {
    private var username = ""
    private var password = ""
    var user = User() {
        didSet {
            username = user.username
            password = user.password
            SettingsManager.shared.loginUser = username
        }
    }
    typealias AuthenticationLoginCallBack = (_ status: Bool, _ message: String) -> Void
    var loginCallback: AuthenticationLoginCallBack?
    let loginManager = LoginManager(userKey: SettingsManager.shared.userKey, passKey: SettingsManager.shared.passKey)
    func authenticateUserWith(_ username: String, andPassword password: String) {
        if username.count  != 0 {
            if password.count != 0 {
                self.verifyUserWith(username, andPassword: password)
            } else {
                self.loginCallback?(false, MessageText.shared.emptyPassMsg)
            }
        } else {
            self.loginCallback?(false, MessageText.shared.emptyUserMsg)
        }
    }
      
    func verifyUserWith(_ username: String, andPassword password: String) {
        if loginManager.validateLogin(with: username, and: password) {
            user.password = password
            user.username = username
            self.loginCallback?(true, MessageText.shared.succesUserandPass)
        } else {
            // invalid credentials
            self.loginCallback?(false, MessageText.shared.invalidUserorPass)
            
        }
    }
       
    func loginCompletionHandler(callBack: @escaping AuthenticationLoginCallBack) {
        self.loginCallback = callBack
    }
    
}
