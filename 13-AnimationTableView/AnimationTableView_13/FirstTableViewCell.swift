//
//  FirstTableViewCell.swift
//  AnimationTableView_13
//
//  Created by 宋澎 on 2018/6/26.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var centerLabel: UILabel!
    
    var gradientLayer:CAGradientLayer = CAGradientLayer()
    
    var centerString:String?{
        didSet{
            self.centerLabel.text = centerString ?? ""
        }
    }
    
    var backColor:UIColor = UIColor.clear{
        didSet{
            self.backgroundColor = backColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor.clear
        
        self.gradientLayer.frame = self.frame
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        
        let color3 = UIColor.clear.cgColor
        
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor
        
        self.gradientLayer.colors = [color1,color2,color3,color4]
        
        self.gradientLayer.locations = [0.2,0.4,0.6,1.0]
        
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
