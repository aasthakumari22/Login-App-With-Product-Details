//
//  ViewController.swift
//  NoBrokerSolve
//
//  Created by Aastha Kumari on 05/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.frame = CGRect(x: 40, y: 100, width: 70, height: 50)
        return label
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 40, y: 150, width: 300, height: 40)
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Enter a email address"
        return textField
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.frame = CGRect(x: 40, y: 200, width: 100, height: 50)
        return label
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 40, y: 250, width: 300, height: 40)
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Enter a password"
        return textField
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.frame = CGRect(x: 120, y: 350, width: 150, height: 40)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    @objc func loginButtonTapped() {
        validateCredentials()
    }
    
    func validateCredentials() {
        
        let validEmail = "User@123.com"
        let validPassword = "Password123"
        
        guard let enteredEmail = emailTextField.text, !enteredEmail.isEmpty,
              let enteredPassword = passwordTextField.text, !enteredPassword.isEmpty else {
            showAlert(message: "Please enter both email and password.")
            return
        }
        
        if enteredEmail == validEmail && enteredPassword == validPassword {
            let secondVC = ProductViewController()
            navigationController?.pushViewController(secondVC, animated: true)
        } else {
            showAlert(message: "Invalid email or password. Please try again.")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}



