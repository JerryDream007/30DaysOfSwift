//
//  RightViewController.swift
//  31-ContainerView
//
//  Created by 宋澎 on 2018/8/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {
    
    @IBOutlet weak var rightListTableView: UITableView!
    
    var currentIndex:IndexPath?{
        didSet{

            if currentIndex?.row == 0 {
                self.rightDataSource = rightFistDataSource
            }else if currentIndex?.row == 1{
                self.rightDataSource = rightSecondDataSource
            }else if currentIndex?.row == 2{
                self.rightDataSource = rightThirdDataSource
            }
            self.rightListTableView.reloadData()
        }
    }

    let rightFistDataSource = ["昌平区","海淀区","大兴区","朝阳区","东城区","西城区"]
    
    let rightSecondDataSource = ["太原","长治","大同","临汾","运城"]
    
    let rightThirdDataSource = ["石家庄","廊坊","三河","北戴河"]
    
    var rightDataSource:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
extension RightViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rightDataSource != nil ? self.rightDataSource!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = rightDataSource?[indexPath.row]
        return cell
    }
}
