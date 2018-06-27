//
//  ViewController.swift
//  PullToRefresh_07
//
//  Created by 宋澎 on 2018/6/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var dataSource = ["🤗🤗🤗🤗🤗"]
    
    let newDataSource = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    
    let listCellID = "listCellID"
    
    lazy var listTableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.plain)
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11, *){
            listTableView.contentInsetAdjustmentBehavior = .always
        }else{
            self.automaticallyAdjustsScrollViewInsets = true
        }
        
        listTableView.delegate = self
        
        listTableView.dataSource = self
        
        listTableView.backgroundColor = UIColor.brown
        
        listTableView.rowHeight = UITableViewAutomaticDimension
        
        listTableView.estimatedRowHeight = 50
        
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: listCellID)
        
        listTableView.refreshControl = self.refreshControl
        
        self.refreshControl.backgroundColor = UIColor.green
        
        self.refreshControl.addTarget(self, action: #selector(self.pullToRefresh), for: UIControlEvents.valueChanged)
        
        let fontSize = UIFont.systemFont(ofSize: 15)
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新", attributes: [NSAttributedStringKey.foregroundColor:UIColor.red,NSAttributedStringKey.font:fontSize])
        
        self.view.addSubview(listTableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listCell = tableView.dequeueReusableCell(withIdentifier: listCellID, for: indexPath)
        
        listCell.textLabel?.text = dataSource[indexPath.row]
        
        listCell.textLabel?.textAlignment = NSTextAlignment.center
        
        return listCell
    }
    
    @objc func pullToRefresh() -> Void {
        
        let max:UInt32 = UInt32(newDataSource.count - 1)
        
        let min:UInt32 = 0
        
        let index:Int = Int(arc4random_uniform(max - min) + min)
        
        print("index = \(index)")
        
        dataSource.append(newDataSource[index])
        
        listTableView.reloadData()
        
        listTableView.refreshControl?.endRefreshing()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

