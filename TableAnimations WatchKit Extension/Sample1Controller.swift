//
//  Sample1Controller.swift
//  TableAnimations
//
//  Created by Sowaka on 2015/07/23.
//  Copyright (c) 2015年 com.myCompany. All rights reserved.
//

import WatchKit
import Foundation

struct Item {
    let name:String
    let rank:Int
}

class Sample1Controller: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    var items = [Item(name: "Gold", rank: 1), Item(name: "Silver", rank: 2), Item(name: "Bronze", rank: 3)]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        table.setNumberOfRows(items.count, withRowType: "ItemRow")
        loadTable()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func loadTable() {
        for i in 0..<items.count {
            let row = table.rowControllerAtIndex(i) as! ItemRow
            row.name.setText(items[i].name)
            row.rank.setText(String(items[i].rank))
        }
    }
    
    private func insertTableRowWithLabelText(#labelText:String) {
        table.insertRowsAtIndexes(NSIndexSet(index: 0), withRowType: "MessageRow")
        
        let row = table.rowControllerAtIndex(0) as! MessageRow
        row.label.setText(labelText)
        row.image.setImageNamed("arrows")
        row.image.startAnimatingWithImagesInRange(NSRange(1...30), duration: 0.75, repeatCount: 1)
        
        let delay = 1.5 * Double(NSEC_PER_SEC)
        let time:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.table.removeRowsAtIndexes(NSIndexSet(index: 0))
        }
    }
    
    @IBAction func tapAlphabetical() {
        items.sort(){$0.name < $1.name}
        loadTable()
        insertTableRowWithLabelText(labelText: "ALPHABETICAL")
    }
    
    @IBAction func tapRanking() {
        items.sort(){$0.rank < $1.rank}
        loadTable()
        insertTableRowWithLabelText(labelText: "RANKING")
    }
}
