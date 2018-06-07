//
//  ViewController.swift
//  SnapChatMenu_04
//
//  Created by 宋澎 on 2018/6/4.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var leftView:LeftView = LeftView.init()
    
    var rightView:RightView = RightView.init()
    
    var centerViewController:CenterViewController = CenterViewController.init()
    
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if #available(iOS 11, *) {
            mainScrollView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        
        leftView = (Bundle.main.loadNibNamed("LeftView", owner: nil, options: nil) as! Array ).first!
        
        rightView = (Bundle.main.loadNibNamed("RightView", owner: nil, options: nil) as! Array).last!
        
        mainScrollView.addSubview(leftView)
        
        mainScrollView.isPagingEnabled = true
        
        mainScrollView.bounces = false
        
        
        mainScrollView.addSubview(centerViewController.view)
        
        mainScrollView.addSubview(rightView)
        
        self.addChildViewController(centerViewController)
        
        centerViewController.didMove(toParentViewController: self)
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.inputSubViewFrame), userInfo: nil, repeats: true)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let viewWidth:CGFloat = self.view.frame.size.width
        
        mainScrollView.contentSize = CGSize.init(width: viewWidth * 3, height: self.view.frame.height)
        
        leftView.frame = CGRect.init(x: 0, y: 0, width: viewWidth, height: self.view.frame.height)
        
        rightView.frame = CGRect.init(x: viewWidth * 2, y: 0, width: viewWidth, height: self.view.frame.height)
        
        centerViewController.view.frame = CGRect.init(x: viewWidth, y: 0, width: viewWidth, height: self.view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func inputSubViewFrame() {
        
        print("\nleftView.frame = \(leftView.frame) \n centerView.frame = \(centerViewController.view.frame) \n rightView.frame = \(rightView.frame) \n")
    }


}

