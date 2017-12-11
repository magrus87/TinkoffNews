//
//  AppDelegate.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 30/11/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = launchController()
        window?.makeKeyAndVisible()
        return true
    }
    
    private func launchController() -> UIViewController {
        let mainModule = NewsListModule()
        if let moduleInput = mainModule.viewController.moduleInput as? NewsListModuleInput {
            moduleInput.configureModule()
        }
        let navigationController = UINavigationController(rootViewController: mainModule.viewController)
        return navigationController
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        AppPersistentContainer.instance.saveContext()
    }
}

