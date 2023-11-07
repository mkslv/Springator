//
//  SceneDelegate.swift
//  SpringAnimation
//
//  Created by Max Kiselyov on 11/6/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let rootViewController = AnimationViewController()
        window.rootViewController = rootViewController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

