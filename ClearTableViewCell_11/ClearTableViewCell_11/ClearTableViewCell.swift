//
//  ClearTableViewCell.swift
//  ClearTableViewCell_11
//
//  Created by 宋澎 on 2018/6/22.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ClearTableViewCell: UITableViewCell {
    
    var gradientLayer: CAGradientLayer = CAGradientLayer()

    @IBOutlet weak var centerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initGraientLayer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func initGraientLayer(){
        
        self.gradientLayer.frame = self.frame
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
        
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
        
        let color3 = UIColor.clear.cgColor
        
        let color4 = UIColor(white: 1.0, alpha: 0.05).cgColor
        
        gradientLayer.colors = [color1,color2,color3,color4]
        
        gradientLayer.locations = [0.0,0.5,0.9,1.0]
        
        self.layer.addSublayer(gradientLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        
    }
    
    override func layoutSubviews() {
        
//        gradientLayer.frame = CGRect(x: gradientLayer.frame.origin.x, y: gradientLayer.frame.origin.y, width: self.frame.width, height: self.frame.height)

    }

}
