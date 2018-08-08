//
//  MainViewController.swift
//  31-ContainerView
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var clickOpenButtonClosure:(() -> Void)?
    
    var clickCloseButtonClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickOpenButton(_ sender: Any) {
        if self.clickOpenButtonClosure != nil {
            self.clickOpenButtonClosure!()
        }
    }
    
    @IBAction func clickCloseButton(_ sender: Any) {
        if self.clickCloseButtonClosure != nil {
            self.clickCloseButtonClosure!()
        }
    }

}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCellID", for: indexPath)
        return cell
    }
}
