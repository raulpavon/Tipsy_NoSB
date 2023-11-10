//
//  Tip.swift
//  Tipsy_NoSB
//
//  Created by Raúl Pavón on 23/02/23.
//

import Foundation

struct Tip: Codable {
    var percentage: String?
    var split: String?
    var totalAmount: String?
    
    init(percentage: String?, split: String?, totalAmount: String?) {
        self.percentage = percentage
        self.split = split
        self.totalAmount = totalAmount
    }
}
