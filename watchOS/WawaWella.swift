//
//  WawaWella.swift
//  day9 WatchKit Extension
//
//  Created by KriDan on 11.05.2021.
//

import WatchKit

class WawaWella: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let detailData = context as! SignInResponse
        image.kf.setImage(with: URL(string: detailData.avatar!))
        print(detailData)
        // Configure interface objects here.
    }
}
