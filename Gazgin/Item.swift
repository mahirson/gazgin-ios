//
//  Item.swift
//  Gazgin
//
//  Created by Nijat Ayyublu on 13.02.26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
