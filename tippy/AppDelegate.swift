//
//  AppDelegate.swift
//  tippy
//
//  Created by Shabari Girish Ganapathy on 12/16/18.
//  Copyright © 2018 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Retrive information to load into application
        let time_1 = UserDefaults.standard.object(forKey: "last_run") as? Date
        let bill = UserDefaults.standard.string(forKey: "bill_amount")
        let elapsed = Date().timeIntervalSince(time_1!)
        let minutes = Int(elapsed/60.0)
        //print(time_1)
        
        //Enter bill amount and calculate tip if the app was closed 10 minutes ago
        if minutes < 10 && bill != nil{
            //print("get's called")
            ViewController.bill_amount = bill!
        }
        else{
            //print("App started")
            ViewController.bill_amount = ""
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UserDefaults.standard.set(ViewController.bill_amount,forKey: "bill_amount")
        UserDefaults.standard.set(Date(),forKey: "last_run")
        UserDefaults.standard.synchronize()
        //print(Date())
    }


}

