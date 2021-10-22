//
//  addShopItemViewController.swift
//  Rene
//
//  Created by Madeleine Harbom on 22/11/2019.
//  Copyright © 2019 Madeleine Harbom. All rights reserved.
//

import UIKit

class addShopItemViewController: UIViewController {
    //Klasse B (delegate vid)

    let stateController = StateController.controller //Jeg burde være en get!!!!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var purchasedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        counterLabel.text = "\(currentValue)"
    }
    
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        guard let name = nameField.text else {return}
        //return statement til saveButton()
        
        let item = ShoppingItem(name: name, purchased: purchasedSwitch.isOn, quantity: Int(amountSlider.value))
        print("save button")
        stateController.addItem(item: item)
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

}
