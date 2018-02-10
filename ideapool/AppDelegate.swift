//
//  AppDelegate.swift
//  ideapool
//
//  Created by Arnaud Phommasone on 9/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let authentificationService = AuthentificationService()
        
        // Test for signing up a user
//        service.signUp(username: "test.arnaud", email: "test.arnaud@codementor.io", password: "the-Secret-123") { (token) in
//            print("token after sign up with test.arnaud : \(token)")
//        }
        
        // Test for loging user
        authentificationService.loginUser(email: "arnaud.phommasone@codementor.io", password: "the-Secret-123") { (token) in
            // Test for refreshing it
            authentificationService.refreshToken(token: token, completion: { (token) in
//                print("after new token \(token.jwt)")
                
                // Test for getting user info
                let userService = UserService()
                userService.getUserInfo(token: token, completion: { (user) in
                    print("user \(user)")
                })
            })
//            print("token \(token)")
            
            // Test for logging out : This is not working and giving error 402
//            service.logoutUser(token: token, completion: { (result) in
//                if (result == true) {
//                    print("logout all good")
//                }
//                else {
//                    print("logout wrong")
//                }
//            })
        }
        
        
        // Test for refreshing a JWT Token
        
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
    }


}

