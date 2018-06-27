//
//  ViewController.swift
//  CustomFont_02
//
//  Created by 宋澎 on 2018/5/30.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var changesFontButton: UIButton!
    
    @IBOutlet weak var listTableView: UITableView!
    
    var dataSource:[String] = ["第一行,哈哈哈","第二行,哈哈哈","第三行,哈哈哈","第四行,哈哈哈","第五行,哈哈哈"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    
    var fontNameIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changesFontButton.layer.cornerRadius = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fontCell = listTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let fontName = fontNames[fontNameIndex]
        
        fontCell.textLabel?.text = dataSource[indexPath.row]
        
        fontCell.textLabel?.font = UIFont(name: fontName, size: 16)
        
        return fontCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    //点击改变字体大小
    @IBAction func clickChangesFontButton(_ sender: Any) {
        
        fontNameIndex = Int(arc4random_uniform(4-0) + 0)
        
        listTableView.reloadData()
    }
    
}

