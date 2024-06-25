//
//  SceneDelegate.swift
//  B&B
//
//  Created by Mario Esposito on 15/03/24.
//

import UIKit
import SwiftUI



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = UIHostingController(rootView: ContentView(datiUtente: userData())) // Se usi SwiftUI
        print("Applying light mode")
        if #available(iOS 13.0, *) {
            print("Applying light mode")
            self.window?.overrideUserInterfaceStyle = .light // Forza il tema chiaro
        }
        self.window?.makeKeyAndVisible()
    }


    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light // Sostituisci .light con .dark per forzare il tema scuro
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

