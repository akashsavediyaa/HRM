//
//  MenuViewController.swift
//  SlideMenu
//
//  Created by akash savediya on 11/05/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titleArr = ["Mark Attendance", "Attendance", "Apply Leave", "Quick Attendance", "Logout"]
    let iconArray = [UIImage(named:"pencil")!,UIImage(named:"calendar")!,UIImage(named:"pencil")!,UIImage(named:"calendar")!,UIImage(named:"calendar")!]
    
    @IBOutlet weak var menu_tableView: UITableView!
    @IBOutlet weak var imageProfile: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menu_tableView.delegate = self
        menu_tableView.dataSource = self
        
        imageProfile.layer.borderColor = UIColor.red.cgColor
//        imageProfile.layer.borderWidth = 2
//        imageProfile.layer.cornerRadius = 50
//        imageProfile.layer.masksToBounds = false
//        imageProfile.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        
        cell.imgIcon.image = iconArray[indexPath.row]
        cell.label_title.text = titleArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let revealViewController : SWRevealViewController = self.revealViewController()
//        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
//        
//        if(){
//            
//        }
        
    }

}
