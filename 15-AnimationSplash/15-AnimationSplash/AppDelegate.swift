//
//  AppDelegate.swift
//  15-AnimationSplash
//
//  Created by 宋澎 on 2018/6/28.
//  Copyright © 2018年 宋澎. All rights reserved.
//  UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate{

    var window: UIWindow?
    
    let imageView = UIImageView()
    
    let maskLayer = CALayer()
    
    let circularRadius = CGFloat(150)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = ViewController()
        
        imageView.frame = (window?.bounds)!
        
        imageView.image = UIImage(named: "screen")
        
        imageView.layer.mask = maskLayer
        
        let twitterImage = UIImage(named: "twitter")
        
        if let realTwitterImage = twitterImage {
            
            maskLayer.contents = realTwitterImage.cgImage
            
            let scale = realTwitterImage.size.height/realTwitterImage.size.width
            
            maskLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100 * scale)
            
            maskLayer.position = imageView.center
        }
        
        //蒙版放大动画
        self.maskLayer.add(self.maskAnimation(), forKey: "maskAnimation")
        
        //位移动画
        self.maskLayer.add(self.moveAnimation(), forKey: "moveUpAnimation")
        
        
        window?.addSubview(imageView)
        
        window?.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func maskAnimation() -> CAAnimation {
        
        let keyFameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        
        keyFameAnimation.delegate = self
        
        keyFameAnimation.beginTime = CACurrentMediaTime() + 3.5
        
        keyFameAnimation.duration = 1
        
        let startPosition = NSValue.init(cgRect: self.maskLayer.frame)
        
        let secondPosition = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: self.maskLayer.frame.width * 0.5, height: self.maskLayer.frame.height * 0.5))
        
        let finalPosition = NSValue.init(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        
        keyFameAnimation.values = [startPosition,secondPosition,finalPosition]
        
        keyFameAnimation.keyTimes = [0,0.3,1]
        
        return keyFameAnimation
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        self.imageView.layer.mask = nil
        
    }
    
    func moveAnimation() -> CAAnimation{
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        
        moveAnimation.beginTime = CACurrentMediaTime() + 0.5
        
        moveAnimation.repeatCount = 1                                                 
        
        let path = UIBezierPath()
        
        path.move(to: self.maskLayer.position)
        
        path.addLine(to: CGPoint(x: self.maskLayer.position.x, y: self.maskLayer.position.y - circularRadius))
        
        path.addArc(withCenter: maskLayer.position, radius: circularRadius, startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(3.0/2.0*Double.pi), clockwise: true)
        
        path.addLine(to: CGPoint(x: self.maskLayer.position.x, y: self.maskLayer.position.y - circularRadius))
        
        path.addLine(to: CGPoint(x: self.maskLayer.position.x, y: self.maskLayer.position.y))
        
        moveAnimation.path = path.cgPath
        
        moveAnimation.duration = 3
        
        return moveAnimation
    }
    
    func groupAnimation() -> CAAnimation{
        
        let groupAnimation = CAAnimationGroup()
        
        groupAnimation.animations = [self.moveAnimation(),self.maskAnimation()]
        
        return groupAnimation
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

