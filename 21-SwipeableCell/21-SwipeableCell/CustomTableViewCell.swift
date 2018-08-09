//
//  CustomTableViewCell.swift
//  21-SwipeableCell
//
//  Created by 宋澎 on 2018/8/9.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

let CustomTableViewCellID = "CustomTableViewCellID"

struct CustomDataModel {
    let imageName:String
    let contentString:String
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
