//
//  RowController.swift
//  day9 WatchKit Extension
//
//  Created by KriDan on 11.05.2021.
//

import Foundation
import WatchKit
import Kingfisher

class RowController: NSObject {
    
    var data: CellData! {
        didSet {
            label.setText(data.labelText)
            image.kf.setImage(with: URL(string: data.imageURl))
        }
    }
    
    
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var label: WKInterfaceLabel!
    
}

