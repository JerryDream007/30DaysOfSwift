//
//  FirstViewController.swift
//  AnimationTableView_13
//
//  Created by 宋澎 on 2018/6/26.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstTableView: UITableView!
    
    var dataSource = [1,2,3,4,5,6,7,8,9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = dataSource + dataSource + dataSource
        
        firstTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        animationTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        animationTableView()
    }
    
    func getColor(index:NSInteger) -> UIColor {
        
        let color = CGFloat(index)/CGFloat(dataSource.count - 1) * 0.6
        
        return UIColor(red: 0.5, green: color, blue: 0.0, alpha: 1.0)
    }
    
    func animationTableView(){
        
        assert(self.firstTableView != nil, "firstTableView == nil")
        
        let cells = self.firstTableView.visibleCells
        
        let tableViewHeight = self.firstTableView.frame.height
        
        for tempCell in cells {
            tempCell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var index = 0
        
        for tempCell in cells{
            UIView.animate(withDuration: 1.5, delay: Double(index) * 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                
                tempCell.transform = CGAffineTransform.identity
                
            }, completion: nil)
            
            index += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FirstViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "FirstCellID", for: indexPath) as! FirstTableViewCell
        
        cell.centerString = String(format: "第 %ld 行", indexPath.row + 1)
        
        cell.backColor = self.getColor(index: indexPath.row)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let b = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewControllerID")

        self.present(b, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}
