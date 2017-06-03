//
//  TimeTableViewController.swift
//  scholacore
//
//  Created by Tarun kaushik on 29/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

//
//  TimeTableViewController.swift
//  Scholacore
//
//  Created by Tarun kaushik on 16/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit
import FirebaseMessaging
import Firebase

class TimeTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,TimeTableCellDelegate {
    @IBOutlet var weekdaysSegmentController: UISegmentedControl!
    @IBOutlet var subjectsTableView: UITableView!
    var newView:UIView!
    @IBOutlet var weekdayContainerView: UIView!
    
    var subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Economics","Principles of Management","Thoery of Everything" , "Engineering maths"]
    var newSubjects = [lecture(subject:"POM" , Hour:9 , Minute:5),lecture(subject:"spss" , Hour:10 , Minute:0),lecture(subject:"Break" , Hour:9 , Minute:5),lecture(subject:"Research Methodology" , Hour:11 , Minute:00),lecture(subject:"Financial Accounting" , Hour:12 , Minute:10),lecture(subject:"Break" , Hour:9 , Minute:5),lecture(subject:"Managerial economics" , Hour:13, Minute:55),lecture(subject:"Principles of Management" , Hour:14 , Minute:40),lecture(subject:"Principles of Management" , Hour:17 , Minute:20),lecture(subject:"Principles of Management" , Hour:18 , Minute:50)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" token \(String(describing: FIRInstanceID.instanceID().token()))")
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //subjectsTableView.frame = CGRect(x:0,y:123,width:view.bounds.size.width,height:view.bounds.size.height-123)
        let switchButton = UISwitch()
        switchButton.isUserInteractionEnabled = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchButton)
        NotificationCenter.default.addObserver(self, selector: #selector(self.forgroundAction), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        setUpWeekDay()
        //self.tabBarItem.badgeColor = UIColor.red
        //self.tabBarItem.badgeValue = "1"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //i m here
        self.forgroundAction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setUpWeekDay(){
        let date = Date()
        let calender = NSCalendar(calendarIdentifier: .gregorian)
        let  myComponet = calender?.components(.weekday, from: date)
        let weekDay = myComponet?.weekday
        if weekDay != 1{
            weekdaysSegmentController.selectedSegmentIndex = weekDay! - 2
        }else{
            newView = UIView(frame:CGRect(x:subjectsTableView.frame.minX,y:subjectsTableView.frame.minY,width: self.view.bounds.width , height: subjectsTableView.frame.height))
            let label = UILabel(frame:CGRect(x:newView.bounds.width/2 - 100 ,y:newView.bounds.height/2 - 25 , width:200, height: 50))
            print("lable frame \(label.frame) and label bounds \(label.bounds)")
            print("new view frame \(newView.frame) and subjectViewFrame \(subjectsTableView.frame)")
            label.backgroundColor = UIColor.white
            newView.backgroundColor = UIColor.blue
            label.text = "HOLIDAY"
            label.textAlignment = .center
            label.textColor = UIColor.red
            label.font = UIFont(name: "HelveticaNeue" , size: 36)
            newView.addSubview(label)
            //subjectsTableView.removeFromSuperview()
            weekdaysSegmentController.selectedSegmentIndex = UISegmentedControlNoSegment
            self.view.addSubview(newView)
        }
    }
    
    @IBAction func segmentController(_ sender: Any) {
        
        switch weekdaysSegmentController.selectedSegmentIndex{
        case 0 :
            subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Economics","Principles of Management","Thoery of Everything" , "Engineering maths"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        case 1 :
            subjects = ["Mathmatics", "Science","Break" , "Biology","TeleCommuncation Accounting","Break","Sports","Principles of engineering","Tarun kaushik" , "Aman Bajaj"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        case 2 :
            subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        case 3 :
            subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        case 4 :
            subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        case 5 :
            subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Aconomics","Principles of Management","Tarun kaushik" , "Aman Bajaj"]
            subjectsTableView.reloadData()
            newView.removeFromSuperview()
            
        default: break
        }
        
    }
    
    // MARK: - Table view data source
    
    func forgroundAction(){
        subjectsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newSubjects.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if subjects[indexPath.row] == "Break"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "breaKcell", for: indexPath)
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TimeTableViewCell
            cell.selectedSegment = weekdaysSegmentController.selectedSegmentIndex
            cell.subjectLabelView.text = subjects[indexPath.row]
            cell.lectureINfo = newSubjects[indexPath.row]
            cell.delegate = self
            cell.setupCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if subjects[indexPath.row] == "Break"{
            return 30.0
        }else{
            return 80.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "subjectDetail") as! subjectDetailsTableView
        vc.subjectTitle = subjects[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func timerDidFinished() {
        subjectsTableView.reloadData()
    }
    
}

