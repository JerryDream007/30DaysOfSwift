//
//  ViewController.swift
//  31-ContainerView
//
//  Created by 宋澎 on 2018/8/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftContainerView: UIView!
    @IBOutlet weak var rightContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftVC = leftContainerView.subviews.first?.next as! LeftViewController
        
        let rightVC = rightContainerView.subviews.first?.next as! RightViewController
        
        leftVC.clickLeftRow = {(indexPath) -> Void in 
            rightVC.currentIndex = indexPath
        }
        
        print("\(leftVC.clickLeftRow)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

