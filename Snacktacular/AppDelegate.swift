//
//  AppDelegate.swift
//  Snacktacular
//
//  Created by Derek Marble on 3/30/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let coloredAppearance = UINavigationBarAppearance()
             coloredAppearance.configureWithOpaqueBackground()
             coloredAppearance.backgroundColor = UIColor(named: "PrimaryColor")
             coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
             coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
             UINavigationBar.appearance().standardAppearance = coloredAppearance
             UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
             let coloredAppearanceToolbar = UIToolbarAppearance()
             coloredAppearanceToolbar.configureWithOpaqueBackground()
             coloredAppearanceToolbar.backgroundColor = UIColor(named: "PrimaryColor")
             UIToolbar.appearance().standardAppearance = coloredAppearanceToolbar
             UIToolbar.appearance().scrollEdgeAppearance = coloredAppearanceToolbar
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

