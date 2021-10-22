//
//  StateController.swift
//  Rene
//
//  Created by Madeleine Harbom on 28/11/2019.
//  Copyright © 2019 Madeleine Harbom. All rights reserved.
//

import Foundation

protocol StateControllerDelegate {
    func dataDidChange()
}

class StateController{
    //Klaase A
    
    static let controller = StateController()
    
    let storage = DummyDB()
    var delegate: StateControllerDelegate?
    
    var theData = [ShoppingItem]() {
        didSet{
            print("didSet")
            delegate?.dataDidChange()
        }
    }
    
    func addItem(item :ShoppingItem) {
        print("add Item func")
        theData.append(item)
        storage.addItem(item: item)
        //theData.append(item)
        //theData = storage.getData()
    }
    
    private init() {
        self.theData = storage.getData()
        print("I can has data")
    
    }

    

    
}
