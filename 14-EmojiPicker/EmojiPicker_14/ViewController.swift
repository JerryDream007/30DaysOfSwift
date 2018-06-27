//
//  ViewController.swift
//  EmojiPicker_14
//
//  Created by 宋澎 on 2018/6/27.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var dataSource = Array<String>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        goButton.layer.cornerRadius = 10
        
        let imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 1...1{
            
            dataSource += imageArray
        }
    }
    
    @IBAction func clickGoButton(_ sender: Any) {
        
        goButton.isEnabled = false
        
        let max:UInt32 = UInt32(self.dataSource.count - 1)
        
        let min:UInt32 = UInt32(0)
        
        let firstRow = Int(arc4random_uniform(max - min) + min)
        
        let secondRow = Int(arc4random_uniform(max - min) + min)
        
        let thirdRow = Int(arc4random_uniform(max - min) + min)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            
            self.pickerView .selectRow(firstRow, inComponent: 0, animated: false)
            
            self.pickerView .selectRow(secondRow, inComponent: 1, animated: false)
            
            self.pickerView .selectRow(thirdRow, inComponent: 2, animated: false)
            
            self.goButton.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            
        }) { (finished) in
            
            self.goButton.transform = CGAffineTransform.identity
            
            self.goButton.isEnabled = true
            
        }
        
        if firstRow == secondRow || secondRow == thirdRow || firstRow == thirdRow{
            
            self.resultLabel.text = "恭喜你,中奖了"
            
        }else{
            
            self.resultLabel.text = "请继续努力"
        }
    }
    
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel()
        
        label.text = dataSource[row]
        
        label.textAlignment = .center
        
        label.font = UIFont.boldSystemFont(ofSize: 80)
        
        return label
    }
}

