//
//  SceneDelegate.swift
//  Task
//
//  Created by Ляйсан Зайнуллина on 22/07/2021.
//  Copyright © 2021 Ляйсан Зайнуллина. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if ((UserDefaults.standard.object(forKey: "email")) != nil){ //если есть текущий пользователь
            self.showProfile() //переходим сразу к профилю
        } else{
            self.showAuthorization() //иначе переходим к странице входа
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func showProfile(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }

        let navigationController = UINavigationController(rootViewController: profileViewController)

        //находим текущего пользователя по сохраненной почте и передаем его как объект
        if let connIndex = profileViewController.data.firstIndex(where: { $0.email == UserDefaults.standard.object(forKey: "email") as? String}){
            profileViewController.prof = profileViewController.data[connIndex]
        }
        window?.rootViewController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    func showAuthorization(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }

        var navigationController = UINavigationController()
        navigationController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navigationController
        navigationController.isNavigationBarHidden = true
    }

    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

