//
//  Item.swift
//  iOS BucketList
//
//  Created by Matias Rietig on 9/12/17.
//  Copyright © 2017 opal. All rights reserved.
//

import Foundation

class Item {
    
    let title: String
    let description: String
    let longitude: Double
    let latitude: Double
    let duedate: Date
    let finished: Bool
    
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
        self.duedate = Date()
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
    
}
