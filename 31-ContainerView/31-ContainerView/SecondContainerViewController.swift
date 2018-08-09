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
    
    let tapView = UIView()
    
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
        
        let openPanGesture = UIPanGestureRecognizer.init(target: self, action: #selector(openPanGesture(panGesure:)))
        self.mainVC?.view.addGestureRecognizer(openPanGesture)
        
        tapView.frame = self.mainContainerView.frame
        self.view.addSubview(tapView)
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(handleTapGesture(tapGesture:)))
        tapView.addGestureRecognizer(tapGesture)
        self.tapView.isHidden = true
    }
    
    @objc func handleTapGesture(tapGesture:UITapGestureRecognizer){
        self.closePersonVC()
    }
    
    //打开手势
    @objc func openPanGesture(panGesure:UIPanGestureRecognizer) -> Void {
        let translation = panGesure.translation(in: panGesure.view)
        let velocity = panGesure.velocity(in: panGesure.view)
        print("translation = \(translation) , velocity = \(velocity)")
        
        switch panGesure.state {
        case .began:
            print("open手势-开始")
        case .changed:
            print("open手势-改变")
            if translation.x > 0 {
                var scale = translation.x / (self.mainVC?.view.frame.width)!
                scale = min(max(0,scale),1)
                self.openWithScale(scale: scale)
            }
        case .cancelled:
            print("open手势-取消")
            self.openWithScale(scale: 0.0)
        case .failed:
            print("open手势-失败")
            self.openWithScale(scale: 0.0)
        case .ended:
            if translation.x > 0{
                if velocity.x > 200{
                    self.openWithScale(scale: 1.0)
                    break;
                }
                let scale = translation.x / (self.mainVC?.view.frame.width)!
                
                if scale > 0.6{
                    self.openWithScale(scale: 1.0)
                }else{
                    self.openWithScale(scale: 0.0)
                }
            }else{
                self.openWithScale(scale: 0.0)
            }
            self.tapView.isHidden = false
            print ("open手势-结束")
        default:
            self.openWithScale(scale: 0.0)
        }
    }
    
    //关闭手势
    @objc func panGestureHandle(panGesure:UIPanGestureRecognizer) -> Void {
        let translation = panGesure.translation(in: panGesure.view)
        let velocity = panGesure.velocity(in: panGesure.view)
        print("translation = \(translation) , velocity = \(velocity)")
        
        switch panGesure.state {
        case .began:print("开始")
        case.changed:
            if translation.x < 0 {
                //左滑
                var scale = fabs(translation.x) / (self.personVC?.view.frame.width)!
                
                scale = min(max(0, scale),1)
                
                self.closeWithScale(scale: scale)
                
                print("改变scale = \(scale),velocity = \(velocity)")
            }
        case .cancelled:self.closeWithScale(scale: 0.0)
        case .failed :self.closeWithScale(scale: 0.0)
        case .ended:
            if translation.x < 0 {
                
                if fabs(velocity.x) > 300 {
                    self.closeWithScale(scale: 1.0)
                    break
                }
                
                //左滑
                var scale = fabs(translation.x) / (self.personVC?.view.frame.width)!
                
                scale = min(max(0, scale),1)
                
                if scale < 0.8 {
                    self.closeWithScale(scale: 0.0)
                }else{
                    self.closeWithScale(scale: 1.0)
                }
                
                
                print("结束:scale = \(scale),velocity = \(velocity)")
                
            }else{
                self.closeWithScale(scale: 0.0)
            }
            self.tapView.isHidden = true
            print("结束:translation.x = \(translation.x),velocity = \(velocity)")
            
        default:
            self.closeWithScale(scale: 0.0)
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
    
    func openWithScale(scale:CGFloat) -> Void{
        UIView.animate(withDuration: 0.1) {
            self.personContainerViewLeftSpace.constant = -(self.leftSpace * (1-scale))
            self.personContainerViewWidth.constant = (self.leftSpace + self.mainContainerView.frame.width * CGFloat((1 - self.mainScale) / 2)) * scale
            let scaleX = self.mainScale + (1-self.mainScale) * (1-scale)
            self.mainContainerView.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleX)
            self.mainContainerLeftSpace.constant = self.leftSpace * scale
        }
    }
    
    func openPersonVC() -> Void {
        self.tapView.isHidden = false
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
        self.tapView.isHidden = true
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
