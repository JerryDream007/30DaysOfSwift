//
//  InteractiveTransition.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/7/4.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

//手势方向
enum InteractiveTransitionGestureDirection {
    case TransitionGestureDirectionLeft
    case TransitionGestureDirectionRight
    case TransitionGestureDirectionUp
    case TransitionGestureDirectionDown
}

//转场类型
enum InteractiveTransitionType {
    case present
    case dismiss
    case push
    case pop
}

class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    //记录手势是否开始,判断pop操作是手势触发还是返回键触发
    var interation:Bool = false
    
    var shouldComplete = false
    
    var targetVC:UIViewController?{
        didSet{
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(panGesture:)))

            targetVC?.view.addGestureRecognizer(pan)
        }
    }
    
    var transitionGestureDirection:InteractiveTransitionGestureDirection
    
    var transitionType:InteractiveTransitionType
    
    var startPresent:(() -> Void)?
    
    var startPush:(() -> Void)?
    
    init(direction:InteractiveTransitionGestureDirection,type:InteractiveTransitionType) {
        
        self.transitionGestureDirection = direction
        
        self.transitionType = type
    }
    
    @objc func handleGesture(panGesture:UIPanGestureRecognizer) -> Void {
        
        let translation = panGesture.translation(in:panGesture.view?.superview)
    
        switch panGesture.state {
        case .began:
            self.interation = true
            self.targetVC?.dismiss(animated: true, completion: nil)
//            self.startTransition()
        case .changed:
            
            var fraction = translation.y / 400.0
            
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            
            self.shouldComplete = fraction > 0.5
            
            self.update(fraction)
            
        case .ended,.cancelled:
            
            self.interation = false
            
            if !self.shouldComplete || panGesture.state == UIGestureRecognizerState.cancelled {
                self.cancel()
            }else{
                self.finish()
            }
            
        default:
            break
        }
    }
    
    func startTransition() -> Void {

        switch self.transitionType{
            
        case .present:
            
            if (self.startPresent != nil) {
                self.startPresent!()
            }
            
        case .dismiss:
            
            self.targetVC?.dismiss(animated: true, completion: nil)
            
        case .push:
            
            if (self.startPush != nil) {
                self.startPush!()
            }
            
        case .pop:
            self.targetVC?.navigationController?.popViewController(animated: true)
        }
    }
    
}


