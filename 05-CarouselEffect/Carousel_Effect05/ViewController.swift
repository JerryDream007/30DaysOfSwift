//
//  ViewController.swift
//  Carousel_Effect05
//
//  Created by 宋澎 on 2018/6/5.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var dataSource:[ListModel] = ListModel.createDataSource(count: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        layout.minimumLineSpacing = 15
        
        layout.itemSize = CGSize(width: self.view.frame.size.width - 30, height: 400)
        
        layout.minimumInteritemSpacing = 15
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal

        listCollectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let listCell = collectionView .dequeueReusableCell(withReuseIdentifier: "listCellID", for: indexPath) as! ListCollectionViewCell
        
        listCell.listModel = dataSource[indexPath.item]
        
        return listCell
    }
}


