//
//  ViewController.swift
//  chat
//
//  Created by KriDan on 10.05.2021.
//

import UIKit

class ViewControllerCustom: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [CellRequestResponse] = [
        CellRequestResponse(id: "daa", message: "Hello my name is dodo pizza", belongsToUser: false, date: Date(timeIntervalSinceNow: 4)),
        CellRequestResponse(id: "daa", message: "hi", belongsToUser: true, date: Date()),
        CellRequestResponse(id: "daa", message: "name's daniil", belongsToUser: true, date: Date(timeIntervalSinceNow: 1)),
        CellRequestResponse(id: "daa", message: "da", belongsToUser: true, date: Date()),
        CellRequestResponse(id: "daa", message: "Hella das da sda do my name is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizzaHello my name is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza", belongsToUser: false, date: Date()),
        CellRequestResponse(id: "daa", message: "Hello my n asd a dad a dame is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza v Hello my name is dodo pizza", belongsToUser: false, date: Date()),
        CellRequestResponse(id: "daa", message: "ah haha aha hhahaha hahahaha hha ahhahahahhahahhha ha ha ha a a a haha a haa a hah a", belongsToUser: true, date: Date(timeIntervalSinceNow: 10)),
        CellRequestResponse(id: "daa", message: "Hello my name is a sd ad asd dodo pizza vHello my name is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza", belongsToUser: false, date: Date()),
        CellRequestResponse(id: "daa", message: "Hello my naasd a sd asme is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza", belongsToUser: false, date: Date(timeIntervalSinceNow: 5)),
        CellRequestResponse(id: "daa", message: "Hello my naa sda d asd ad a dad ad as das d asdme is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza Hello my name is dodo pizza", belongsToUser: false, date: Date(timeIntervalSince1970: TimeInterval(9312))),
        CellRequestResponse(id: "daa", message: "bye", belongsToUser: false, date: Date())
    
    ]
    
    func sortCells(){
        messages.sort(by: { x, y in
            guard let dateX = x.date, let dateY = y.date else {return true}
            return dateX < dateY
        })
    }
    
    let chatCellId = "chatCell"
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatCell.self, forCellReuseIdentifier: chatCellId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortCells()
        initTableView()
        
        // Do any additional setup after loading the view.
    }
}

extension ViewControllerCustom: UITableViewDelegate {
    
}
extension ViewControllerCustom: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellId, for: indexPath) as! ChatCell
        cell.cellData = messages[indexPath.item]
        return cell
    }
    
    
}
