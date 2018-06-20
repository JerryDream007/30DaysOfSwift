//
//  VideoCutter.swift
//  VideoBackground_10
//
//  Created by 宋澎 on 2018/6/13.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

public extension String {
    var convert:NSString{
        return (self as NSString)
    }
}

open class VideoCutter: NSObject {
    
    var test:String = "1"
    
    func testFunc() -> Void {
        test.convert.appendingPathComponent("sdf")
    }
}
