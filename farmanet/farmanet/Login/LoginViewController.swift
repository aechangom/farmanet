//
//  LoginViewController.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    var loginVM = LoginViewModel()
    
    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginErrorDescriptionLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        usernameTextField.text = ""
        passwordTextField.text = ""
        self.navigationController?.isNavigationBarHidden = true
    }
    func setUI() {
       
        loginButton.layer.cornerRadius = 5
        self.loginErrorDescriptionLabel.isHidden = true
        
    }
    func setDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
       
    }
    func goToNextView() {
        let pharmacyTableVC = PharmacyViewController(nibName: "PharmacyViewController", bundle: nil)
        self.navigationController?.pushViewController(pharmacyTableVC, animated: true)
    }
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        guard let userName = self.usernameTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            
            if status {
                self.goToNextView()
            } else {
                self.loginErrorDescriptionLabel.text = message
                self.loginErrorDescriptionLabel.isHidden = false
                self.loginErrorDescriptionLabel.textColor = UIColor.red
            }
        }
        
        loginVM.authenticateUserWith(userName, andPassword: password)
        
    }
 
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginErrorDescriptionLabel.isHidden = true
        usernameTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
