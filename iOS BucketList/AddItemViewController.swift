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
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
}
