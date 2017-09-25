//
//  EditItemViewController.swift
//  iOS BucketList
//
//  Created by Cabell Glancy on 9/24/17.
//  Copyright © 2017 opal. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    var path = 0
    var name = ""
    var desc = ""
    var lat = 0.0
    var long = 0.0
    var date: Date = Date()

    @IBAction func Cancel(_ sender: UIBarButtonItem) {
            dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var LongitudeField: UITextField!
    @IBOutlet weak var LatitudeField: UITextField!
    @IBOutlet weak var DescriptionField: UITextField!
    @IBOutlet weak var DueDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.text = name;
        DescriptionField.text = desc;
        LongitudeField.text = String(long);
        LatitudeField.text = String(lat);
        DueDate.date = date;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
