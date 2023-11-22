//
//  LoginController.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//


import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func noaccountButton(_ sender: Any) {
        navigateToRegisterScreen()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if let username = usernameTextField.text, !username.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            
            if let storedUsername = UserDefaults.standard.string(forKey: "username"),
               let storedPassword = UserDefaults.standard.string(forKey: "password") {
                
                if username == storedUsername && password == storedPassword {
                    navigateToHomeScreen()
                } else {
                    showAlert(message: "Wrong Username or Password.")
                }
            } else {
                showAlert(message: "User Not Found.")
            }
        } else {
            showAlert(message: "Please enter a username and password.")
        }
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "About", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func navigateToRegisterScreen() {
        if let registerViewController = storyboard?.instantiateViewController(withIdentifier: "RegisterController") {
            navigationController?.show(registerViewController, sender: self)
        }
    }
    
    private func navigateToHomeScreen() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.showMainScreen()
        
//        if let homeViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") {
//            if let sceneDelegate = UIApplication.shared.delegate as? SceneDelegate {
//                sceneDelegate.window?.rootViewController = homeViewController
//                sceneDelegate.window?.makeKeyAndVisible()
//            }
//        }
    }
}
