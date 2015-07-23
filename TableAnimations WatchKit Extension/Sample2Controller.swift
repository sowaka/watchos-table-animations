//
//  Sample2Controller.swift
//  TableAnimations
//
//  Created by Sowaka on 2015/07/23.
//  Copyright (c) 2015年 com.myCompany. All rights reserved.
//

import WatchKit
import Foundation


class Sample2Controller: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    var isFull:Bool = false

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        table.setNumberOfRows(3, withRowType: "ContentRow")
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = table.rowControllerAtIndex(rowIndex) as! ContentRow
        row.shortDescriptionLabel.setHidden(!isFull)
        row.moreLabel.setHidden(!isFull)
        row.fullDescriptionLabel.setHidden(isFull)
        row.lessLabel.setHidden(isFull)
        isFull = !isFull
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
