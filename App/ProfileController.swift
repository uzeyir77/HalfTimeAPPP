//
//  ProfileController.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class ProfileController: UIViewController {
    
    
    @IBOutlet weak var newUsernameTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()

        
            if let storedUsername = UserDefaults.standard.string(forKey: "username") {
                newUsernameTextField.text = storedUsername
            }

            
        }

        @IBAction func saveChangesButtonTapped(_ sender: UIButton) {
            if let newUsername = newUsernameTextField.text, !newUsername.isEmpty,
               let newPassword = newPasswordTextField.text, !newPassword.isEmpty {
                
                UserDefaults.standard.set(newUsername, forKey: "username")
                UserDefaults.standard.set(newPassword, forKey: "password")

            
                showAlert(message: "Changes saved successfully.")
            } else {
                showAlert(message: "Please enter a new username and password.")
            }
        }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "About", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)  
        }))
        present(alert, animated: true, completion: nil)
    }

    }
