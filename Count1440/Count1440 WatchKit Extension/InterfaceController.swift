//
//  InterfaceController.swift
//  Count1440 WatchKit Extension
//
//  Created by Zabrina Brodale on 1/2/18.
//  Copyright © 2018 Zabrina Brodale. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var YouHave: WKInterfaceLabel!
    @IBOutlet var Min: WKInterfaceLabel!
    @IBOutlet var LeftToday: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setMin), userInfo: nil, repeats: true)
    }
    
    @objc func setMin() {
        
        if CLKComplicationServer.sharedInstance().activeComplications != nil {
            
            for comp in CLKComplicationServer.sharedInstance().activeComplications! {
                
                CLKComplicationServer.sharedInstance().reloadTimeline(for: comp)
            }
        }
        
        let now = Date()
        let calendar = Calendar.current
        
        let hours = calendar.component(.hour, from: now)
        let minutes = calendar.component(.minute, from: now)
        
        let minutesLeft :Int = Int(1440 - ((hours * 60) + minutes))
        
        let message :String = String(minutesLeft)
    
        Min.setText(message)

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
