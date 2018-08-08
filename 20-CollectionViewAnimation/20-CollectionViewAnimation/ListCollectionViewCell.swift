//
//  ListCollectionViewCell.swift
//  20-CollectionViewAnimation
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    var clickBackButtonClosure:(() -> Void)?
    var viewModel:ListViewModel?{
        didSet{
            if let _viewModel = viewModel {
                self.topImageView.image = UIImage.init(named: _viewModel.imagePath)
            }
            self.contentLabel.numberOfLines = 3
            self.backButton.isHidden = true
        }
    }
    
    func handleSelectedCell() -> Void {
        self.backButton.isHidden = false
        self.contentLabel.numberOfLines = 0
        self.superview?.bringSubview(toFront: self)
    }
    
    @IBAction func clickBackButton(_ sender: Any) {
        if clickBackButtonClosure != nil {
            self.clickBackButtonClosure!()
        }
    }
}
