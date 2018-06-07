//
//  ListModel.swift
//  Carousel_Effect05
//
//  Created by 宋澎 on 2018/6/5.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ListModel {
    
    var imageName:String
    var titleString:String
    
    init(imageName:String,titleString:String) {
        self.imageName = imageName
        self.titleString = titleString
    }
    
    class func createDataSource(count:NSInteger) -> [ListModel] {
        
        var tempArray:[ListModel] = Array()
        
        let imageArray = ["bodyline","darkvarder","dudu","hello","hhhhh","run","wave"]
        
        for index in 1...count {
            
            print("index = \(index)")
            
            if index < imageArray.count {
                tempArray.append(ListModel(imageName: imageArray[index], titleString: String(format: "这是第%ld张", index)))
            }else{
                tempArray.append(ListModel(imageName: "bodyline", titleString: "哈喽"))
            }
        }
        
        return tempArray
    }
}
