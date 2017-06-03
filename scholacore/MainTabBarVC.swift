//
//  MainTabBarVC.swift
//  scholacore
//
//  Created by Tarun kaushik on 29/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the vie
        self.navigationItem.title = "NEWSFEED"
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add , target: FirstViewController() , action: #selector(FirstViewController.addPostAction) ), animated: false)
        self.navigationItem.setLeftBarButton(nil, animated: false)
        tabBar.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let title = item.title{
            switch title{
            case "NewsFeed":
                self.navigationItem.title = "NEWSFEED"
                self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add , target: FirstViewController() , action: #selector(FirstViewController.addPostAction) ), animated: false)
                self.navigationItem.setLeftBarButton(nil, animated: false)
                
            case "Notifications": self.navigationItem.title = "NOTIFICATIONS"
            self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add , target: NotificationsViewController() , action: #selector(NotificationsViewController.addNotification) ), animated: false)
            self.navigationItem.setLeftBarButton(nil, animated: false)
                
            case "Profile": self.navigationItem.title = "PROFILE"
            self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: userProfileTableViewController() , action:#selector(userProfileTableViewController.savedata) ), animated: false)
            self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: userProfileTableViewController() , action: #selector(userProfileTableViewController.cancelChange)), animated: false)
            case "TIMETABLE": self.navigationItem.title = "TIMETABLE"
            let switchButton = UISwitch()
            switchButton.isUserInteractionEnabled = true
            //self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView:switchButton)
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = nil
                
            default: self.navigationItem.title = "CLASSNOTES"
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = nil
            }
        }
    }
    
    @IBAction func unwindToMainTab(segue:UIStoryboardSegue){
        
    }
    
    
    
}