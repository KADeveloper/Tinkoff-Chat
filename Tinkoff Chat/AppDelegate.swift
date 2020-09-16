//
//  AppDelegate.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 14.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private func printInConsole(description: String, function: String) {
        #if DEBUG
        print("\(description)" + "\(function)")
        #endif
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        printInConsole(description: "Application moved from <Not running> to <Inactive>: ", function: "\(#function)")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        printInConsole(description: "Application moved from <Inactive> to <Active>: ", function: "\(#function)")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        printInConsole(description: "Application moved from <Active> to <Inactive>: ", function: "\(#function)")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        printInConsole(description: "Application moved from <Background> to <Inactive>: ", function: "\(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        printInConsole(description: "Application moved from <Inactive> to <Background>: ", function: "\(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        printInConsole(description: "Application moved from <Background> to <Suspended>: ", function: "\(#function)")
    }
}

