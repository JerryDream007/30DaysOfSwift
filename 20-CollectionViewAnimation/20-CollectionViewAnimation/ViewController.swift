//
//  ViewController.swift
//  20-CollectionViewAnimation
//
//  Created by 宋澎 on 2018/8/7.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

extension Array {
    func safeIndex(index:NSInteger) -> Any? {
        return index < self.count && index > 0 ? self[index] : nil
    }
}

class ViewController: UIViewController {

    private struct StoryboardName{
        static let CellIdentifier = NSStringFromClass(ListCollectionViewCell.self)
    }
    
    private struct AnimationConfig{
        static let AnimationDuration = 0.5
        static let AnimationDelay = 0.0
        static let AnimationSpringDamping = CGFloat(0.6)
        static let AniamtionInitialSpringVelocity:CGFloat = 1.0
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:[ListViewModel] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = ListDataSource().images!
    }

}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    //StoryboardName.CellIdentifier
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = self.dataSource[indexPath.row]
        cell.clickBackButtonClosure = { () -> Void in
            self.collectionView.reloadItems(at: [indexPath])
            self.collectionView.isScrollEnabled = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ListCollectionViewCell {
            
            cell.handleSelectedCell()
            
            UIView.animate(withDuration: AnimationConfig.AnimationDuration, delay: AnimationConfig.AnimationDelay, usingSpringWithDamping: AnimationConfig.AniamtionInitialSpringVelocity, initialSpringVelocity: AnimationConfig.AniamtionInitialSpringVelocity, options: .curveEaseInOut, animations: {
                
                cell.frame = self.collectionView.bounds
                
            }) { (_) in
                collectionView.isScrollEnabled = false
            }
            
            
        }
    }
}

