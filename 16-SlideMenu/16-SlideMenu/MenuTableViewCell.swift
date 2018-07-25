//
//  MenuTableViewCell.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/7/2.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var centerTitleLabel: UILabel!
    
    var titleString:String?{
        didSet{
            centerTitleLabel.text = titleString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
