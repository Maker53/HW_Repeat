//
//  ViewController.swift
//  HM_2.3
//
//  Created by Станислав on 11.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUser()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self

        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let greetingsVC = $0 as? GrettingsViewController {
                greetingsVC.userName = user
            } else if let navigationVC = $0 as? UINavigationController {
                if let profileVC = navigationVC.topViewController as? ProfileViewController {
                    profileVC.user = user
                }
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user.name || passwordTF.text != user.password  {
            showAlert(
                with: "Invalid login or password",
                message: "Please, enter the correct login and password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func userForgottButtonspressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "Oops!🙀", message: "Your User Name is \(user.name)")
        : showAlert(with: "Oops!🙀", message: "Your password if \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? GrettingsViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - TextFieldShouldReturn
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showGreetingsVC", sender: nil)
        }
        return true
    }
}
