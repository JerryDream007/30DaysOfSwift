//
//  SecondContainerViewController.swift
//  31-ContainerView
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class SecondContainerViewController: UIViewController {

    @IBOutlet weak var personContainerView: UIView!
    
    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet weak var personContainerViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var personContainerViewLeftSpace: NSLayoutConstraint!
    
    @IBOutlet weak var mainContainerLeftSpace: NSLayoutConstraint!
    
    var personVC:PersonViewController?
    
    var mainVC:MainViewController?
    
    let leftSpace = CGFloat(3.0/4.0) * UIScreen.main.bounds.width
    
    let mainScale:CGFloat = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.closePersonVC()
        
        self.personContainerViewWidth.constant = self.leftSpace
        
        self.personVC = self.personContainerView.subviews.first?.next as? PersonViewController
        
        self.mainVC = self.mainContainerView.subviews.first?.next as? MainViewController
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureHandle(panGesure:)))
        
        self.personVC?.view.addGestureRecognizer(panGesture)
        
        mainVC?.clickOpenButtonClosure = { () -> Void in
            self.openPersonVC()
        }
        
        mainVC?.clickCloseButtonClosure = { () -> Void in
            self.closePersonVC()
        }
    }
    
    //关闭手势
    @objc func panGestureHandle(panGesure:UIPanGestureRecognizer) -> Void {
        let translation = panGesure.translation(in: panGesure.view)
        let velocity = panGesure.velocity(in: panGesure.view)
        print("translation = \(translation) , velocity = \(velocity)")
        
        if translation.x < 0 , fabs(velocity.x) > 500 {
            self.closePersonVC()
            return
        }
        
        switch panGesure.state {
        case .began:print("开始")
        case.changed:
            if translation.x < 0 {
                //左滑
                var scale = fabs(translation.x) / (self.personVC?.view.frame.width)!
                
                scale = min(max(0, scale),1)
                
                self.closeWithScale(scale: scale)
                
                print("改变scale = \(scale)")
            }
        case .cancelled:self.closeWithScale(scale: 0.0)
        case .failed :self.closeWithScale(scale: 0.0)
        case .ended:
            if translation.x < 0 {
                //左滑
                var scale = fabs(translation.x) / (self.personVC?.view.frame.width)!
                
                scale = min(max(0, scale),1)
                
                if scale < 0.6 {
                    self.closeWithScale(scale: 0.0)
                }else{
                    self.closeWithScale(scale: 1.0)
                }
                
                print("结束:scale = \(scale)")
            }else{
                self.closeWithScale(scale: 0.0)
            }
            
            print("结束:translation.x = \(translation.x)")
            
        default:break
            
        }
        
        
    }
    
    func closeWithScale(scale:CGFloat) -> Void {
        UIView.animate(withDuration: 0.1) {
            self.personContainerViewLeftSpace.constant = -(self.leftSpace * scale)
            self.mainContainerLeftSpace.constant = self.leftSpace * (1 - scale)
            let scaleX = self.mainScale + (1 - self.mainScale) * scale
            self.mainContainerView.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleX)
            self.view.layoutIfNeeded()
        }
    }
    
    func openPersonVC() -> Void {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.personContainerViewLeftSpace.constant = 0
            self.personContainerViewWidth.constant = self.leftSpace + self.mainContainerView.frame.width * CGFloat((1 - self.mainScale) / 2)
            self.mainContainerView.transform = CGAffineTransform.init(scaleX: self.mainScale, y: self.mainScale)
            self.mainContainerLeftSpace.constant = self.leftSpace
            self.view.layoutIfNeeded()
        }) { (_) in
            
        }
        
    }
    
    func closePersonVC() -> Void {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.89, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.personContainerViewLeftSpace.constant = -self.leftSpace
            self.mainContainerLeftSpace.constant = 0
            self.mainContainerView.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()
        }) { (_) in
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.closePersonVC()
    }
}
