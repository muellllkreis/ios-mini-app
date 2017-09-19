//
//  AddItemViewController.swift
//  iOS BucketList
//
//  Created by Matias Rietig on 9/12/17.
//  Copyright © 2017 opal. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var longitudeField: UITextField!

    @IBOutlet weak var latitudeField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func Save(_ sender: UIBarButtonItem) {
        
        let newitem = Item(title: nameField.text!, description: descriptionField.text!, longitude: Double(longitudeField.text!)!, latitude: Double(latitudeField.text!)!, duedate: dateField.date, finished: false)
        
        let i = navigationController?.viewControllers.index(of: self)
        let targetController = navigationController?.viewControllers[i!-1] as! ViewController
        
        targetController.bucketList.append(newitem)
        targetController.bucketList = Item.DoubleSort(list: targetController.bucketList)
        for i in targetController.bucketList {
            print(i.title)
        }
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newitem = Item(title: nameField.text!, description: descriptionField.text!, longitude: Double(longitudeField.text!)!, latitude: Double(latitudeField.text!)!, duedate: dateField.date, finished: false)
        
        if(segue.identifier == "SaveSegue") {
            //let destinationVC = segue.destination as! UINavigationController
            //let targetController = destinationVC.topViewController as! ViewController
            
            let i = navigationController?.viewControllers.index(of: self)
            let targetController = navigationController?.viewControllers[i!-1] as! ViewController
            
            targetController.bucketList.append(newitem)
            targetController.bucketList = Item.DoubleSort(list: targetController.bucketList)
            targetController.tableView.numberOfRows(inSection: targetController.bucketList.count)
            for i in targetController.bucketList {
                print(i.title)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
}
