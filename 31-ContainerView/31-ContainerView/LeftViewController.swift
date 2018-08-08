//
//  LeftViewController.swift
//  31-ContainerView
//
//  Created by 宋澎 on 2018/8/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    let leftDataSource = ["北京","山西","河北"]
    
    var clickLeftRow:((_ currentIndexPath:IndexPath) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LeftViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = leftDataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if clickLeftRow != nil {
            self.clickLeftRow!(indexPath)
        }
    }
}
