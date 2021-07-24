//
//  ProfileViewController.swift
//  Task
//
//  Created by Ляйсан Зайнуллина on 23/07/2021.
//  Copyright © 2021 Ляйсан Зайнуллина. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var exitButton: UIButton!
    
    var prof: ProfileData? //текущий профиль
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        //выводим на экран данные пользователя
        photoView.image = prof?.photo
        nameTextField.text = prof?.name
        surnameTextField.text = prof?.surname
        emailTextField.text = prof?.email
    }
    
    @IBAction func exitAction(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "email") //удаляем текущего пользователя
        
        //переходим на страницу входа
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        navigationController?.pushViewController(vc, animated: false)
    }
    
    var data: [ProfileData] = [ProfileData(photo: UIImage(systemName: "person.crop.circle.fill") ?? UIImage(),
                                           name: "Lyaysan", surname: "Zaynullina", email: "lyaysan263@gmail.com"),
                               ProfileData(photo: UIImage(systemName: "person.crop.circle.fill") ?? UIImage(), name: "Ivan", surname: "Ivanov", email: "test@te.ru")]
}

struct ProfileData {
        var photo: UIImage
        var name: String
        var surname: String
        var email: String
}


