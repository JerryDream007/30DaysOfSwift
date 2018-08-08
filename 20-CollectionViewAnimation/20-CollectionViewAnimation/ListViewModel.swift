//
//  ListViewModel.swift
//  20-CollectionViewAnimation
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

struct ListViewModel {
    let imagePath:String
    
    init(imagePath:String?) {
        self.imagePath = imagePath ?? ""
    }
}
