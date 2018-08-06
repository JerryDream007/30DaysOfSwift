//
//  ViewController.swift
//  19-PullRefresh
//
//  Created by 宋澎 on 2018/8/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var listTableView: UITableView!
    
    var timer:Timer?
    
    let refreshControl = UIRefreshControl()
    
    var headerRefreshView:HeaderRefreshView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.backgroundColor = UIColor.yellow
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        self.listTableView.addSubview(refreshControl)
        
        let array = Bundle.main.loadNibNamed("HeaderRefreshView", owner: nil, options: nil)
        if array != nil {
            self.headerRefreshView = array?.first as? HeaderRefreshView
            if headerRefreshView != nil {
                headerRefreshView?.frame = self.refreshControl.bounds
                refreshControl.addSubview(headerRefreshView!)
            }
        }
    }

    @objc func refreshTableView() -> Void {
        
        if self.refreshControl.isRefreshing {
            self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (_) in
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.refreshControl.isRefreshing {
            self.headerRefreshView?.startAnimation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "a")
        
        cell.textLabel?.text = "第" + String(indexPath.row + 1) + "行"
        
        return cell
    }
    
    
}

