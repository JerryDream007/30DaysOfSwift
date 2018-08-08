//
//  ListDataSource.swift
//  20-CollectionViewAnimation
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import Foundation

struct ListDataSource {
    private let imagePaths = ["1-1","2-1","3-1","4-1","5-1"]
    var images: [ListViewModel]?
    init() {
        images = imagePaths.map({ (path) -> ListViewModel in
            return ListViewModel.init(imagePath: path)
        })
    }
}
