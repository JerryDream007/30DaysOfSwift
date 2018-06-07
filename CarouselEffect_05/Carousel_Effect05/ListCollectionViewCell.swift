//
//  ListCollectionViewCell.swift
//  Carousel_Effect05
//
//  Created by 宋澎 on 2018/6/5.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var listModel:ListModel?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        
        if listModel != nil {
            
            centerImageView.image = UIImage(named: listModel!.imageName)
            
            bottomLabel.text = listModel!.titleString
        }
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        self.layer.cornerRadius = 10
    }
}
