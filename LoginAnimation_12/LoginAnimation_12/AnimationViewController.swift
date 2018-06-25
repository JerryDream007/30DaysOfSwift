//
//  AnimationViewController.swift
//  LoginAnimation_12
//
//  Created by 宋澎 on 2018/6/25.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var accountCenter: NSLayoutConstraint!
    
    @IBOutlet weak var passwordCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.accountCenter.constant = -self.accountTextField.frame.width;
        
        self.passwordCenter.constant = -self.accountTextField.frame.width;
        
        self.loginButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
           
            self.accountCenter.constant = 0
            
            self.passwordCenter.constant = 0
            
            self.view.layoutIfNeeded()
            
        }) { (bool) in
            print("bool = \(bool)")
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                
                self.loginButton.alpha = 1.0
                
            }, completion: nil)
        }
        
    }
    
    @IBAction func clickLoginButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
            
            self.loginButton.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            
        }) { (isFinished) in
            
            if isFinished {
                self.loginButton.transform = CGAffineTransform.identity
            }
        }
        
    }

    @IBAction func clickBackButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
