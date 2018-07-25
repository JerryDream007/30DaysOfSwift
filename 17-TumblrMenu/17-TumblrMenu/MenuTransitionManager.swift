//
//  MenuTransitionManager.swift
//  17-TumblrMenu
//
//  Created by 宋澎 on 2018/7/25.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject {
    
    private var isPresenting: Bool = false
    
    func animationTransitionWithPresent(transitionContext:UIViewControllerContextTransitioning) -> Void {
        
        let containerView = transitionContext.containerView
        
        let mainVC = transitionContext.viewController(forKey: .from)
        
        let menuVC = transitionContext.viewController(forKey: .to) as! MenuViewController
        
        let mainView = mainVC?.view
        
        let menuView = menuVC.view
        
        containerView.addSubview((mainView)!)
        
        containerView.addSubview((menuView)!)
        
        let leftTransform = CGAffineTransform.init(translationX: -300, y: 0)
        
        let rightTransform = CGAffineTransform.init(translationX: 300, y: 0)
        
        menuVC.imageView1.transform = leftTransform
        
        menuVC.imageView3.transform = leftTransform
        
        menuVC.imageView2.transform = rightTransform
        
        menuVC.imageView4.transform = rightTransform
        
        menuVC.label1.transform = leftTransform
        
        menuVC.label3.transform = leftTransform
        
        menuVC.label2.transform = rightTransform
        
        menuVC.label4.transform = rightTransform
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            menuVC.imageView1.transform = CGAffineTransform.identity
            
            menuVC.imageView3.transform = CGAffineTransform.identity
            
            menuVC.imageView2.transform = CGAffineTransform.identity
            
            menuVC.imageView4.transform = CGAffineTransform.identity
            
            menuVC.label1.transform = CGAffineTransform.identity
            
            menuVC.label3.transform = CGAffineTransform.identity
            
            menuVC.label2.transform = CGAffineTransform.identity
            
            menuVC.label4.transform = CGAffineTransform.identity
            
        }) { (isFinished) in
            
            transitionContext.completeTransition(true)
            
        }
        
    }
    
    func animationTransitionWithDismiss(transitionContext:UIViewControllerContextTransitioning) -> Void {
        
        let containerView = transitionContext.containerView
        
        let mainVC = transitionContext.viewController(forKey: .to)
        
        let menuVC = transitionContext.viewController(forKey: .from) as! MenuViewController
        
        let mainView = mainVC?.view
        
        let menuView = menuVC.view
        
        containerView.addSubview((mainView)!)
        
        containerView.addSubview((menuView)!)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            let leftTransform = CGAffineTransform.init(translationX: -300, y: 0)
            
            let rightTransform = CGAffineTransform.init(translationX: 300, y: 0)
            
            menuVC.imageView1.transform = leftTransform
            
            menuVC.imageView3.transform = leftTransform
            
            menuVC.imageView2.transform = rightTransform
            
            menuVC.imageView4.transform = rightTransform
            
            menuVC.label1.transform = leftTransform
            
            menuVC.label3.transform = leftTransform
            
            menuVC.label2.transform = rightTransform
            
            menuVC.label4.transform = rightTransform

        }) { (isFinished) in
            
            transitionContext.completeTransition(true)
            
        }
    }
}

extension MenuTransitionManager: UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresenting {
            self.animationTransitionWithPresent(transitionContext: transitionContext)
        }else{
            self.animationTransitionWithDismiss(transitionContext: transitionContext)
        }
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        self.isPresenting = true
        
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        self.isPresenting = false
        
        return self
    }
}
