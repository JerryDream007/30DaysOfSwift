//
//  ViewController.swift
//  ImageScrollerEffect_09
//
//  Created by 宋澎 on 2018/6/11.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var effectView: UIVisualEffectView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var currentImageView: UIImageView!
    
    
    @IBOutlet weak var currentImageTopSpace: NSLayoutConstraint!
    
    @IBOutlet weak var currentImageLeftSpace: NSLayoutConstraint!
    
    @IBOutlet weak var currentImageRightSpace: NSLayoutConstraint!
    
    @IBOutlet weak var currentImageBottomSpace: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let widthScale = view.frame.width/currentImageView.frame.width
        
        let heightScale = view.frame.height/currentImageView.frame.height
        
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        
        scrollView.maximumZoomScale = 3.0
        
        scrollView.zoomScale = minScale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return currentImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let yOffset = max(0, (view.frame.height - currentImageView.frame.height)/2)
        
        currentImageTopSpace.constant = yOffset
        
        currentImageBottomSpace.constant = yOffset
        
        let xOffset = max(0, (view.frame.width - currentImageView.frame.width)/2)
        
        currentImageLeftSpace.constant = xOffset
        
        currentImageRightSpace.constant = xOffset
        
        view.layoutIfNeeded()
    }

}

