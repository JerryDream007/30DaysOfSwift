//
//  ViewController.swift
//  24-MosaicLayout
//
//  Created by 宋澎 on 2018/8/16.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let mosaicLayout = FMMosaicLayout()
    var dataSouce = Array<String>()
    
    struct StoryboardID {
        let cellID = "LayoutCellID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mosaicLayout.delegate = self
        self.collectionView.collectionViewLayout = self.mosaicLayout
        
        for index in 1...21{
            print("index = \(index)")
            let string = String(index) + "-1"
            dataSouce.append(string)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,FMMosaicLayoutDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSouce.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardID().cellID, for: indexPath) as? LayoutCollectionViewCell{
            let string = dataSouce[indexPath.item]
            cell.centerImageView.image = UIImage(named: string)
            
            let time:UInt64 = UInt64(arc4random() % 600 / 1000)
            let when = DispatchTime.now().uptimeNanoseconds + time
            let test = DispatchTime.init(uptimeNanoseconds: when)
            DispatchQueue.main.asyncAfter(deadline: test) {
                cell.alpha = 0.0
                UIView.animate(withDuration: 0.8) {
                    cell.alpha = 1.0
                }
            }
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }
    
    @nonobjc func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 1, left: 2, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath!) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
}

