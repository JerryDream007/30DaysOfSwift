//
//  MainViewController.swift
//  16-SlideMenu
//
//  Created by 宋澎 on 2018/6/29.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var presentTransitionManager = TransitonManager(isPresent: true)
    
    var dismissTransitionManager = TransitonManager(isPresent: false)
    
    var presentInteractiveTransition: InteractiveTransition?
    
    var dismissInteractiveTransition: InteractiveTransition?
    
    var imageDataSource = ["1-1","2-1","3-1","4-1","5-1","a-1","b-1","d-1","c-1","e-1","f-1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.transitioningDelegate = self
        
        self.listTableView.isScrollEnabled = false
        
        presentInteractiveTransition = InteractiveTransition(direction: .TransitionGestureDirectionUp, type: .present)
        
        presentInteractiveTransition?.targetVC = self
        
        presentInteractiveTransition?.startPresent = { () -> Void in
            
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            
            let menuVC = story.instantiateViewController(withIdentifier: "MenuViewControllerID")
            
            self.dismissInteractiveTransition?.targetVC = menuVC
            
            menuVC.transitioningDelegate = self
            
            self.present(menuVC, animated: true, completion: nil)
        }
        
        dismissInteractiveTransition = InteractiveTransition(direction: .TransitionGestureDirectionDown, type: .dismiss)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let menuViewController = segue.destination as! MenuViewController
        
        self.dismissInteractiveTransition?.targetVC = menuViewController
        
        menuViewController.transitioningDelegate = self
    }
    
    @IBAction func close123(segue:UIStoryboardSegue){
        
    }
}

extension MainViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listCell = tableView.dequeueReusableCell(withIdentifier: "ListCellID", for: indexPath) as! MainTableViewCell
        
        listCell.backgroundImageString = imageDataSource[indexPath.row]
        
        if indexPath.row == 2 {
            listCell.centerString = nil
        }else{
            listCell.centerString = imageDataSource[indexPath.row]
        }
        
        return listCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

extension MainViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self.presentTransitionManager
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return self.dismissTransitionManager
    }
    
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    
//        return nil;
        
//        return (self.presentInteractiveTransition?.interation)! ? self.presentInteractiveTransition : nil
//    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
//        return nil;
        
        return (self.dismissInteractiveTransition?.interation)! ? self.dismissInteractiveTransition : nil
    }

}
