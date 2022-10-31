//
//  SceneDelegate.swift
//  Translate
//
//  Created by HYEONG SIK NAM on 2022/08/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.backgroundColor = .systemBackground
        self.window?.rootViewController = TabBarController()
        self.window?.tintColor = .mainTintColor
        self.window?.makeKeyAndVisible()
    }
}

