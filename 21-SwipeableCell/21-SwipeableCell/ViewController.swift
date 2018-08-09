//
//  ViewController.swift
//  21-SwipeableCell
//
//  Created by 宋澎 on 2018/8/9.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var dataSource = [
        CustomDataModel(imageName: "1-1", contentString: "Hello world 1 - 1"),
        CustomDataModel(imageName: "2-1", contentString: "Hello world 2 - 1"),
        CustomDataModel(imageName: "3-1", contentString: "Hello world 3 - 1"),
        CustomDataModel(imageName: "4-1", contentString: "Hello world 4 - 1"),
        CustomDataModel(imageName: "5-1", contentString: "Hello world 5 - 1"),
        CustomDataModel(imageName: "6-1", contentString: "Hello world 6 - 1"),
        CustomDataModel(imageName: "7-1", contentString: "Hello world 7 - 1"),
        CustomDataModel(imageName: "8-1", contentString: "Hello world 8 - 1"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellID, for: indexPath) as? CustomTableViewCell {
            let model = self.dataSource[indexPath.row]
            cell.leftImageView.image = UIImage(named: model.imageName)
            cell.contentLabel.text = model.contentString
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction.init(style: .normal, title: "🗑\n删除") { (action, index) in
            print("点击了删除,action = \(action) indexPath = \(indexPath)")
        }
        deleteAction.backgroundColor = UIColor.gray
        
        let shareAction = UITableViewRowAction.init(style: .normal, title: "分享") { (action, index) in
            print("点击了分享,action = \(action) indexPath = \(indexPath)")
            let model = self.dataSource[indexPath.row]
            let image = UIImage(named: model.imageName)
            let url = URL(string: "www.baidu.com")
            let activityController = UIActivityViewController(activityItems: [model.imageName,image!,url], applicationActivities: nil)
            activityController.excludedActivityTypes = [UIActivityType.mail,UIActivityType.message,UIActivityType.airDrop]
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor.red
        
        let downloadAction = UITableViewRowAction.init(style: .normal, title: "下载") { (action, index) in
            print("点击了下载,action = \(action) indexPath = \(indexPath)")
        }
        downloadAction.backgroundColor = UIColor.blue
        return [deleteAction,shareAction,downloadAction]
    }
}

