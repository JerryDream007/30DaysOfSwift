//
//  TransitonManager.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/7/3.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit


class TransitonManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate{
    
    var isPresent = false
    
    var durationTime = 1.0
    
    var snapView:UIView?
    
    init(isPresent:Bool) {
        
        self.isPresent = isPresent
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent {
            self.presentAnimation(transitionContext: transitionContext)
        }else{
            self.dismissAnimation(transitionContext: transitionContext)
        }
        
    }
    
    func presentAnimation(transitionContext: UIViewControllerContextTransitioning) -> Void {
        
        let fromVC = transitionContext.viewController(forKey: .from)
        
        let fromView = fromVC?.view
        
        let toView = transitionContext.view(forKey: .to)
        
        let containerView = transitionContext.containerView
        
        snapView = fromView?.snapshotView(afterScreenUpdates: true)
        
        snapView?.layer.cornerRadius = 20
        
        snapView?.clipsToBounds = true
        
        fromView?.isHidden = true
        
        containerView.addSubview(snapView!)
        
        containerView.addSubview(toView!)
        
        toView?.frame = CGRect(x: 0, y: (containerView.frame.height), width: (toView?.frame.width)!, height: 500)
        
        UIView.animate(withDuration: durationTime, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.snapView?.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
            
            self.snapView?.layer.cornerRadius = 30
            
            toView?.layer.cornerRadius = 30
            
            toView?.frame = CGRect(x: 0, y: (containerView.frame.height) - 500, width: (containerView.frame.width), height: 500)
            
        }) { (_) in
            
            transitionContext.completeTransition(true)
            
            fromView?.isHidden = false
        }
    }
    
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning) -> Void {
        
        let fromView = transitionContext.view(forKey: .from)
        
        let toView = transitionContext.view(forKey: .to)
        
        let containerView = transitionContext.containerView
        
        snapView = toView?.snapshotView(afterScreenUpdates: true)
        
        snapView?.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
        
        containerView.addSubview(self.snapView!)
        
        containerView.addSubview(fromView!)
        
        UIView.animate(withDuration: durationTime, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveLinear, animations: {
            
            self.snapView?.transform = CGAffineTransform.identity
            
            fromView?.frame = CGRect(x: 0, y: (containerView.frame.height), width: (toView?.frame.width)!, height: 500)
            
        }) { (finished) in
            
            transitionContext.completeTransition(true)
        }
    }
}
