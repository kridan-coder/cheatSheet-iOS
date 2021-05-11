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
    
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        ApiClient().signIn(parameters: SignInRequest(email: "junior@wsr.ru", password: "junior"), success: {response in
            
            self.goNext(response: response)
            
        })
    }
    
    func goNext(response: SignInResponse){
        pushController(withName: "ahaha", context:response)
    }
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        loadTableData()
        // Configure interface objects here.
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
