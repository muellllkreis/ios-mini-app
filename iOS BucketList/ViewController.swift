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
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "UVa Bucket List"
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
        cell.textLabel?.text = bucketList[row].title
        
    
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        print(bucketList[row].title)
    }
    
    @IBOutlet weak var tableView: UITableView!
}

