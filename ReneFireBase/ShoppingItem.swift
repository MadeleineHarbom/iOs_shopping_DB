//
//  ShoppingItem.swift
//  Rene
//
//  Created by Madeleine Harbom on 28/11/2019.
//  Copyright © 2019 Madeleine Harbom. All rights reserved.
//

import Foundation

class ShoppingItem {
    var name: String
    var purchased: Bool = false
    var quantity: Int
    //var id : String
    
    init(name : String, purchased: Bool, quantity: Int) {
        self.name = name
        self.purchased = purchased
        self.quantity = quantity
    }
}
