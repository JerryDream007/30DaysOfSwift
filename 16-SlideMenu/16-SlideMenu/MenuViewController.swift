//
//  MenuViewController.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/6/29.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var dataSource = ["firstTitle","secondTitle","thirdTitle"]

    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.isScrollEnabled = false

        UIApplication.shared.statusBarStyle = .default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let mainVC = segue.destination as! MainViewController
        
        if let selectedRow = self.menuTableView.indexPathForSelectedRow?.row {
            
            mainVC.title = self.dataSource[selectedRow]
        }
    }
}

extension MenuViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellID", for: indexPath) as! MenuTableViewCell
        
        cell.titleString = dataSource[indexPath.row]
        
        return cell
    }
    
}
