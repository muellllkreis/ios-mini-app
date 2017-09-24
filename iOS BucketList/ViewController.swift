//
//  ViewController.swift
//  iOS BucketList
//
//  Created by Matias Rietig on 9/12/17.
//  Copyright © 2017 opal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var bucketList = Item.createBucketList()
    let textCellIdentifier = "TextCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UVa Bucket List"
        tableView.delegate = self
        tableView.dataSource = self
        
        self.bucketList = Item.DoubleSort(list: bucketList)
        
        //self.bucketList.sort{
        //    if $0.finished != $1.finished {
        //        return false
        //    }
        //    else {
        //        return $0.duedate < $1.duedate
        //    }
        //}

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        let row = indexPath.row
        //let date = formatter.string(from: bucketList[row].duedate)
        cell.textLabel?.text = bucketList[row].title
        let lbl = cell.contentView.viewWithTag(2) as! UILabel
        let date = bucketList[row].duedate
        lbl.text = formatter.string(for: date)
        
        if(bucketList[row].finished) {
            cell.backgroundColor = UIColor.lightGray
        }
        else {
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }
    
    //func RDate(before: Int)-> Date?{
    //    var dateComponents = DateComponents()
    //    dateComponents.year = 2017
    //    dateComponents.month = 9
    //    let random_seed = arc4random_uniform(UInt32(before))
    //    dateComponents.day = Int(random_seed)
  
    //    let curcal = Calendar.current
    //    let date = curcal.date(from: dateComponents)
    //    return date
    //}
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveNewItemUnwind(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AddItemViewController,
            let title = sourceVC.nameField.text,
            let description = sourceVC.descriptionField.text,
            let longitude = Double(sourceVC.longitudeField.text!),
            let latitude = Double(sourceVC.latitudeField.text!),
            let duedate = sourceVC.dateField.date as? Date {
            
            let newitem = Item(title: title, description: description, longitude: longitude, latitude: latitude, duedate: duedate, finished: false)
            
            self.bucketList.append(newitem)
            self.bucketList = Item.DoubleSort(list: self.bucketList)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit_Item"{
        if let controller = segue.destination as? UINavigationController {
        if let nextView = controller.topViewController as? EditItemViewController {
        print("test")
        let ip = sender as! IndexPath
            print(ip.row)
        nextView.name = self.bucketList[ip.row].title
        nextView.lat = self.bucketList[ip.row].latitude
        nextView.long = self.bucketList[ip.row].longitude
        nextView.desc = self.bucketList[ip.row].title
        nextView.date = self.bucketList[ip.row].duedate
        print(self.bucketList[ip.row].title)
            
         }
        }
        }
    }
    
    // Lets you add various buttons when you swipe
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            //let cell = tableView.dequeueReusableCell(withIdentifier: self.textCellIdentifier, for: index)
            //let cell = tableView.cellForRow(at: editActionsForRowAt.row)!// as! UITableViewCell
            let cell = tableView.cellForRow(at: editActionsForRowAt)!
            if(self.bucketList[index.row].finished) {
                self.bucketList[index.row].finished = false
                cell.setSelected(false, animated: true)
                //print(self.bucketList[index.row].title)
                //print(self.bucketList[index.row].finished)
            }
            else {
                self.bucketList[index.row].finished = true
                cell.selectionStyle = .blue
                cell.textLabel?.text = "LOL"
                cell.setSelected(true, animated: true)
                print(self.bucketList[index.row].title)
                print(self.bucketList[index.row].finished)
            }
            self.bucketList = Item.DoubleSort(list: self.bucketList)
            tableView.reloadData()
        }
        done.backgroundColor = .green
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
                    self.performSegue(withIdentifier: "Edit_Item", sender: index)
        }
        edit.backgroundColor = .orange
        
        
        return [done, edit]
    }}

