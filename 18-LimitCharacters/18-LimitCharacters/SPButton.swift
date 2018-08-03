//
//  SPButton.swift
//  18-LimitCharacters
//
//  Created by 宋澎 on 2018/8/3.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class SPButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var intrinsicContentSize: CGSize{
        
        return CGSize.init(width: self.frame.size.width + 15, height: self.frame.size.height)
    }
}
