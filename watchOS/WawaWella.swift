//
//  WawaWella.swift
//  day9 WatchKit Extension
//
//  Created by KriDan on 11.05.2021.
//

import WatchKit

class WawaWella: WKInterfaceController {
    @IBOutlet weak var etoNazvaniePosviachaetsiaSOBAKEKOTORAYAGAVKAETNEPERESTAVAYASUKAAAAAAAAA: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let detailData = context as! CellData
        etoNazvaniePosviachaetsiaSOBAKEKOTORAYAGAVKAETNEPERESTAVAYASUKAAAAAAAAA.setText(detailData.labelText)
        
        // Configure interface objects here.
    }
}
