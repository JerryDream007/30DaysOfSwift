//
//  AppDelegate.swift
//  22-3DTouchQuickAction
//
//  Created by 宋澎 on 2018/8/14.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "111")
        //增加3DTouch有两种方法
        //1.在info.plist中增加
        //2.使用代码增加
        //利用代理响应点击
        self.addShortcutItem()
        
        self.window?.rootViewController = firstVC
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func addShortcutItem() -> Void {
        var array = Array<UIApplicationShortcutItem>()
        let icon1 = UIApplicationShortcutIcon.init(type: .search)
        let item1 = UIApplicationShortcutItem.init(type: "searchType123", localizedTitle: "搜索", localizedSubtitle: "", icon: icon1, userInfo: nil)
        array.append(item1)
        UIApplication.shared.shortcutItems = array
    }
    
    func handle3DTouchOpen(shortcutItem: UIApplicationShortcutItem) -> Void {
        guard let type = shortcutItem.type as? String else {
            return
        }
        print("type = \(type)")
        let secondVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "222")
        self.window?.rootViewController?.present(secondVC, animated: true, completion: nil)
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        self.handle3DTouchOpen(shortcutItem: shortcutItem)
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

