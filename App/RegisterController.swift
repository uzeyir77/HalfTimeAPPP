//
//  RegisterController.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//
import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var newUsernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    var onLogin: ((String?, String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        if let newUsername = newUsernameTextField.text,
            !newUsername.isEmpty,
            let newPassword = newPasswordTextField.text,
            !newPassword.isEmpty {
                        UserDefaults.standard.set(newUsername, forKey: "username")
            UserDefaults.standard.set(newPassword, forKey: "password")
            
            onLogin?(newUsername, newPassword)
            
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(message: "Please enter new Username and Password.")
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
