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
    var newView:UIView?
    @IBOutlet var weekdayContainerView: UIView!
    
    var subjects = ["Project Management", "SPSS","Break" , "Research Methodology","Financial Accounting","Break","Managerial Economics","Principles of Management","Thoery of Everything" , "Engineering maths"]
    var newSubjects = [lecture(subject:"POM" , Hour:9 , Minute:10,Duration: 55),lecture(subject:"spss" , Hour:10 , Minute:5,Duration: 55),lecture(subject:"Break" , Hour:9 , Minute:5,Duration: 10),lecture(subject:"Research Methodology" , Hour:11 , Minute:15, Duration: 55),lecture(subject:"Financial Accounting" , Hour:12 , Minute:10, Duration: 55),lecture(subject:"Break" , Hour:9 , Minute:5, Duration: 30),lecture(subject:"Managerial economics" , Hour:13, Minute:45, Duration: 55),lecture(subject:"Principles of Management" , Hour:14 , Minute:40, Duration: 55),lecture(subject:"Principles of Management" , Hour:15 , Minute:35, Duration: 55),lecture(subject:"Principles of Management" , Hour:16 , Minute:30, Duration: 30)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       var timetable = timeTableViewModel()
        //timetable.createTimeTable()
        timetable.createLecture()
        
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
            weekdaysSegmentController.sendActions(for: UIControlEvents.valueChanged)
        }else{
            newView = UIView(frame:CGRect(x:subjectsTableView.frame.minX,y:subjectsTableView.frame.minY,width: self.view.bounds.width , height: subjectsTableView.frame.height))
            if let newV = newView{
            let label = UILabel(frame:CGRect(x:newV.bounds.width/2 - 100 ,y:newV.bounds.height/2 - 25 , width:200, height: 50))
            print("lable frame \(label.frame) and label bounds \(label.bounds)")
            print("new view frame \(newV.frame) and subjectViewFrame \(subjectsTableView.frame)")
            label.backgroundColor = UIColor.white
            newV.backgroundColor = UIColor.blue
            label.text = "HOLIDAY"
            label.textAlignment = .center
            label.textColor = UIColor.red
            label.font = UIFont(name: "HelveticaNeue" , size: 36)
            newV.addSubview(label)
            //subjectsTableView.removeFromSuperview()
            weekdaysSegmentController.selectedSegmentIndex = UISegmentedControlNoSegment
            self.view.addSubview(newV)
            }}
    }
    
    @IBAction func segmentController(_ sender: Any) {
        
        switch weekdaysSegmentController.selectedSegmentIndex{
        case 0 :
            subjects = ["Strategic Management", "Strategic Management","Break" , "Entrepreneurship Development","Operation Research","Break","Strategic Management","Customer Relationship Management","Consumer Behaviour" , "Mentoring"]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
        case 1 :
            subjects = ["Innovation Tech. & Change Management", "Innovation Tech. & Change Management","Break" , "Digital Marketing","Digital Marketing","Break","Operation Research","Consumer Behaviour","Investment Analysis & Portfolio Management" , "Mentoring"]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
        case 2 :
            subjects = ["Corporate Taxation", "Corporate Taxation","Break" , "Customer Relationship Management","Customer Relationship Management","Break","Strategic Management","Innovation Tech. & Change Management","Entrepreneurship Development" , "OFF"]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
        case 3 :
            subjects = ["Innovation Tech. & Change Management", "Innovation Tech. & Change Management","Break" , "Entrepreneurship Development","Strategic Management","Break","Operations Research","Financial Risk Management","Aptitude Training" , "Aptitude Training "]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
        case 4 :
            subjects = ["CRC", "Corporate Taxation","Break" , "Strategic Management","Entrepreneurship Development","Break","Operation Research","Consumer Behaviour","Financial Risk Management" , "OFF"]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
        case 5 :
            subjects = ["Management Of Financial Services", "Management Of Financial Services","Break" , "Strategic Management","Innovation Tech. & Change Management","OFF","OFF","OFF","OFF" , "OFF"]
            subjectsTableView.reloadData()
            if let newV = newView{
                newV.removeFromSuperview()
            }
            
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
        }else if subjects[indexPath.row] == "OFF"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "off", for: indexPath)
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
            return 20.0
        }else{
            return 60.0
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

