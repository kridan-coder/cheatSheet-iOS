//
//  InterfaceController.swift
//  day9 WatchKit Extension
//
//  Created by KriDan on 11.05.2021.
//

import WatchKit
import Foundation

struct CellData {
    var labelText: String
    var imageURl: String
}

class InterfaceController: WKInterfaceController {

    let tableData: [CellData] = [CellData(labelText: "Privet!", imageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTti2je5jP4NJyie2Gjynf4ZklgkTOOGdloLQ&usqp=CAU"), CellData(labelText: "DAAAAAAA!", imageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTti2je5jP4NJyie2Gjynf4ZklgkTOOGdloLQ&usqp=CAU"), CellData(labelText: "agadfadsasd!", imageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTti2je5jP4NJyie2Gjynf4ZklgkTOOGdloLQ&usqp=CAU"), CellData(labelText: "Privet!", imageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTti2je5jP4NJyie2Gjynf4ZklgkTOOGdloLQ&usqp=CAU") ]
    
    func loadTableData(){
        tableView.setNumberOfRows(tableData.count, withRowType: "WatchCell")
        
        for i in 0..<tableData.count {
            let rowController = tableView.rowController(at: i) as! RowController
            rowController.data = tableData[i]
            
        }
    }
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTableData()
        // Configure interface objects here.
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "ahaha", context: tableData[rowIndex])
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
