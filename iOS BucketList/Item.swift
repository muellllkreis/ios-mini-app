//
//  Item.swift
//  iOS BucketList
//
//  Created by Matias Rietig on 9/12/17.
//  Copyright © 2017 opal. All rights reserved.
//

import Foundation

class Item {
    
    var title: String
    var description: String
    var longitude: Double
    var latitude: Double
    var duedate: Date
    var finished: Bool
    
    // Position in the table
    let horizPos: Int
    let vertPos: Int
    
    init(title: String, description: String, longitude: Double, latitude: Double, duedate: Date, finished: Bool) {
        self.title = title
        self.description = description
        self.longitude = longitude
        self.latitude = latitude
        self.duedate = duedate
        self.finished = finished
        self.horizPos = 0
        self.vertPos = 0
    }
    
    init(title: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        self.title = title
        self.description = ""
        self.longitude = 0.0
        self.latitude = 0.0
        self.duedate = Item.RDate(before: 30)!
        self.finished = false
        self.horizPos = 0
        self.vertPos = 0
    }
    
    static func createBucketList() -> Array<Item> {
        var bucketlist = Array<Item>()
        for i  in 1...5 {
            bucketlist.append(Item(title: "Item" + String(i)))
        }
        return bucketlist
    }
    
    static func RDate(before: Int)-> Date?{
        var dateComponents = DateComponents()
        dateComponents.year = 2017
        dateComponents.month = 9
        let random_seed = arc4random_uniform(UInt32(before))
        dateComponents.day = Int(random_seed)
        
        let curcal = Calendar.current
        let date = curcal.date(from: dateComponents)
        return date
    }
    
    static func DoubleSort(list: Array<Item>) -> Array<Item> {
        return list.sorted{
            if $0.finished != $1.finished {
                return false
            }
            else {
                return $0.duedate < $1.duedate
            }
        }
    }
}
