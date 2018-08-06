//
//  HeaderRefreshView.swift
//  19-PullRefresh
//
//  Created by 宋澎 on 2018/8/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class HeaderRefreshView: UIView {

    @IBOutlet weak var centerLabel: UILabel!
    
    func startAnimation() -> Void {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {

            self.centerLabel.transform = CGAffineTransform.init(scaleX: 2, y: 2)
            
        }) { (isFinish) in
            self.centerLabel.transform = CGAffineTransform.identity
        }
                       
    }

}
