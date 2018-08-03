//
//  ViewController.swift
//  18-LimitCharacters
//
//  Created by 宋澎 on 2018/8/3.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var toolView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notification:)), name: .UIKeyboardWillHide, object: nil)

        
        NotificationCenter.default.addObserver(self, selector: #selector(test(notification:)), name: NSNotification.Name(rawValue: "test"), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "test"), object: "test")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func clickCloseButton(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func test(notification:Notification){
        let objc = notification.object
        
        let info = notification.userInfo
    }
    
    @objc func keyboardWillShow(notification:Notification) -> Void {
        
        let userInfo = notification.userInfo

        guard userInfo != nil else {
            return
        }
        
        let keyboardFrame = userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue
        
        let duration = userInfo![UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        
        guard keyboardFrame != nil , duration != nil else {
            
           return
        }
        
        let frame = keyboardFrame?.cgRectValue
        
        UIView.animate(withDuration: (duration?.doubleValue)!) {
            self.toolView.transform = CGAffineTransform.init(translationX: 0, y: -((frame?.size.height)!))
        }
    }
    
    @objc func keyboardWillHidden(notification:Notification) -> Void{
        
        let userInfo = notification.userInfo
        
        let duration = userInfo![UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        
        if duration != nil {
            UIView.animate(withDuration: (duration?.doubleValue)!) {
                self.toolView.transform = CGAffineTransform.identity
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

