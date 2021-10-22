//
//  DummyDB.swift
//  Rene
//
//  Created by Madeleine Harbom on 28/11/2019.
//  Copyright © 2019 Madeleine Harbom. All rights reserved.
//

import Foundation


class DummyDB {
    
    init() {
        if shoppinglist.count == 0 {
            dummyData()
       }
        else {
            print("Dude! I already have data, back off")
        }
    }
    var shoppinglist = [ShoppingItem]()
    
    func addItem(item : ShoppingItem) {
        shoppinglist.append(item)
        print("item appended to storage")
    }
    
    
    func dummyData() {
        addItem(item: ShoppingItem(name: "Lussekatt", purchased: true, quantity: 15))
        addItem(item: ShoppingItem(name: "Brunkager", purchased: false, quantity: 5))
        addItem(item: ShoppingItem(name: "Marsipsangrin", purchased: false, quantity: 50))
        addItem(item: ShoppingItem(name: "Glogg", purchased: true, quantity: 2))
        addItem(item: ShoppingItem(name: "Deviled eggs", purchased: true, quantity: 80))
        addItem(item: ShoppingItem(name: "Pebernodder", purchased: false, quantity: 3))
        print("Pupulation complete")
    }
    
    func getData() -> [ShoppingItem]{
        //skulle nok vaere en kopi, men "fukkit" -- Rene
        return shoppinglist
    }
}
