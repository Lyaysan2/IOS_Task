//
//  ViewController.swift
//  Task
//
//  Created by Ляйсан Зайнуллина on 22/07/2021.
//  Copyright © 2021 Ляйсан Зайнуллина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var authorizationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var statusTextView: UITextView!
    
    //email and password
    private var dictionary: [String : String] = ["test@te.ru" : "abcD123", "lyaysan263@gmail.com" : "qwerT45"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusTextView.text = ""
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //проверка корректности формата почты
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    //проверка корректности формата пароля
    func isValidPassword(_ password: String) -> Bool {
        let pasRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{6,}"
        let pasPred = NSPredicate(format:"SELF MATCHES %@", pasRegEx)
        return pasPred.evaluate(with: password)
    }
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        statusTextView.textColor = .red
        
        if (!isValidEmail(email) && !isValidPassword(password)){
            statusTextView.text = "Wrong email and password format\n\nThe password must contain at least 6 characters including at least 1 uppercase letter, lowercase letter and number."
            
        } else if (!isValidEmail(email)){
            statusTextView.text = "Wrong email format"
        } else if (!isValidPassword(password)){
            statusTextView.text = "Wrong password format\n\nThe password must contain at least 6 characters including at least 1 uppercase letter, lowercase letter and number."
        } else if (dictionary[email] == password){
            
            guard let profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
            
            UserDefaults.standard.set(email, forKey: "email") //создаем текущего пользователя
            
            if let ind = profileViewController.data.firstIndex(where: { $0.email == email }){ //находим индекс объекта в массиве по email
                profileViewController.prof = profileViewController.data[ind] //передаем этот объект профилю
            }
            
            navigationController?.pushViewController(profileViewController, animated: true)
            
        } else{
            statusTextView.text = "Wrong email or password"
        }
    }
    

}

