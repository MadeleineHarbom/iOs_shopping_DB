//
//  ViewController.swift
//  Rene
//
//  Created by Madeleine Harbom on 22/11/2019.
//  Copyright © 2019 Madeleine Harbom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let stateController = StateController.controller

    @IBOutlet weak var listeTableView: UITableView! {
        didSet {
            //naar view bliver sat, skal den vide at selv er datasource
            listeTableView.dataSource = self //viewController er datasource til listeTableaView
            listeTableView.delegate = self //listTableView ved nu at den skal kalde extention2s metoder
            listeTableView.rowHeight = UITableView.automaticDimension
            listeTableView.estimatedRowHeight = 100
        }
    }
    var theData: [ShoppingItem] = Array()
    
    
   
    
    override func viewDidLoad() {
        stateController.delegate = self
        theData = stateController.theData
        for data in theData {
            print(data.name)
        }
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for data in theData {
            print("VievController did appear: " + data.name)
            
        }
//        super.viewDidAppear(true)
//        listeTableView.reloadData()
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationVS = segue.destination as! ItemDetailViewController
            //destinationVS.item = theListOfShoppingItems[(listeTableView.indexPathForSelectedRow?.row)]
        }
    }
}

extension ViewController :  UITableViewDataSource {
    //extention1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //bruges hver gang en bestemt row skal vises
        //kaldes for hver row i byggeprocessen
        let cell = listeTableView.dequeueReusableCell(withIdentifier: "theCell", for: indexPath) as! cellenavn
        //indexpath fra parameter
        //faar enten ny celle eller genbrugsselle
        cell.name.text = "Celle \(theData[indexPath.row].name)"
        return cell
        
    }
}

extension ViewController : UITableViewDelegate {
    //extention2
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //laver en knap ved swipe til hoejre (knappene er i venstre)
        let accept = UIContextualAction(style: .normal, title:"Acceptieren", handler: {(action, view, nil) in //handler er her nil
            let alert = UIAlertController(title: "Naaaah", message: "Du hast acceptieren getrukken", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Naaa", style: .default, handler: nil))
            //selF er viewet
            self.present(alert, animated: true)
        })
        accept.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        

        let delete = UIContextualAction(style: .normal, title:"Delete", handler: {(action, view, nil) in //handler er her nil
            let alert = UIAlertController(title: "Naaaah", message: "Du hast deleteschen getrukken", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Naaa", style: .destructive, handler: nil))
            //selF er viewet
            self.present(alert, animated: true)
        })
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [delete, accept])
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //hvis man swiper venstre
        return UISwipeActionsConfiguration(actions: [])
    }
}

extension ViewController : StateControllerDelegate {
    func dataDidChange() {
        theData = stateController.theData
        print("print from didchange i VC")
        
        listeTableView.reloadData()
    }
}


