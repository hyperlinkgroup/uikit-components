//
//  SceneDelegate.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit
import UIKitComponents

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = BaseNavigationController(rootViewController: MainController())
            
            self.window = window
            
            window.makeKeyAndVisible()
        }
    }

}
