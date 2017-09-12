//
//  Item.swift
//  iOS BucketList
//
//  Created by Matias Rietig on 9/12/17.
//  Copyright © 2017 opal. All rights reserved.
//

import Foundation

struct Item {
    
    let title: String
    let description: String
    let longitude: Double
    let latitude: Double
    let duedate: Date
    let finished: Bool
    
    // Position in the table
    let horizPos: Int
    let vertPos: Int
}
