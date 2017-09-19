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
        
        self.bucketList.sort{
            if $0.finished != $1.finished {
                return false
            }
            else {
                return $0.duedate < $1.duedate
            }
        }

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
}

