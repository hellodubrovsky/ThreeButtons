//
//  AppDelegate.swift
//  ThreeButtons
//
//  Created by Илья Дубровский on 04.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        guard let window else { return false }
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        return true
    }
}
