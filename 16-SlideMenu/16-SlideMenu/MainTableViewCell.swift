//
//  MainTableViewCell.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/6/29.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var centerLabel: UILabel!
    
    var backgroundImageString:String?{
        didSet{
            backgroundImageView.image = UIImage(named: backgroundImageString!)
        }
    }
    
    var centerString:String?{
        didSet{
            centerLabel.text = centerString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
