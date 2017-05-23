//
//  ProfileVC.swift
//  HRM
//
//  Created by akash savediya on 18/05/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    var menu_vc : MenuViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    func respondToGesture(gesture : UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right Swipe")
            showMenu() //show menu
            
        case UISwipeGestureRecognizerDirection.left:
            print("Left Swipe")
            closeOnSwipe()
            
        default:
            break
        }
        
    }
    

    
    @IBAction func menu(_ sender: UIBarButtonItem) {
    
        if AppDelegate.menu_bool {
            
            showMenu()
            
        } else {
            
            closeMenu()
            
        }
    
    }
    
    
    func closeOnSwipe() {
        
        if AppDelegate.menu_bool {
            
            //  showMenu()
            
        } else {
            
            closeMenu()
            
        }
        
    }
    
    func showMenu() {
        
        UIView.animate(withDuration: 0.3) { () -> Void in
            
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            
            self.addChildViewController(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
            
        }
        
    }
    
    func closeMenu() {
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }) { (finished) in
            
            self.menu_vc.view.removeFromSuperview()
        }
        
        AppDelegate.menu_bool = true
        
        
    }

}
