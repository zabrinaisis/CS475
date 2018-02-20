//
//  ComplicationController.swift
//  Count1440 WatchKit Extension
//
//  Created by Zabrina Brodale on 1/2/18.
//  Copyright © 2018 Zabrina Brodale. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry

        func setIt() {
            let now = Date()
            let calendar = Calendar.current
        
            let hours = calendar.component(.hour, from: now)
            let minutes = calendar.component(.minute, from: now)
        
            let minutesLeft :Int = Int(1440 - ((hours * 60) + minutes))
        
            let message :String = String(minutesLeft)
        
            if complication.family == .modularSmall {
                let template  = CLKComplicationTemplateModularSmallSimpleText()
                template.textProvider = CLKSimpleTextProvider(text: message)
                let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
                handler(entry)
            }
            else if complication.family == .modularLarge {
                let template  = CLKComplicationTemplateModularLargeTallBody()
                template.headerTextProvider = CLKSimpleTextProvider(text: "")
                template.bodyTextProvider = CLKSimpleTextProvider(text: message)
                let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
                handler(entry)
            }
            else if complication.family == .circularSmall {
                let template  = CLKComplicationTemplateCircularSmallSimpleText()
                template.textProvider = CLKSimpleTextProvider(text: message)
                let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
                handler(entry)
             }
             else if complication.family == .utilitarianSmall {
                let template  = CLKComplicationTemplateUtilitarianSmallFlat()
                template.textProvider = CLKSimpleTextProvider(text: message)
                let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
                handler(entry)
             }
             else if complication.family == .utilitarianLarge {
                let template  = CLKComplicationTemplateUtilitarianLargeFlat()
                template.textProvider = CLKSimpleTextProvider(text: message)
                let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
                handler(entry)
             }
        }
        setIt()
        
        //let server = CLKComplicationServer.sharedInstance()
        
        /*for comp in (server.activeComplications)! {
            server.reloadTimeline(for: comp)
        }*/
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached.
        
        if complication.family == .modularSmall {
            let template  = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "1440")
            handler(template)
        }
        else if complication.family == .modularLarge {
            let template  = CLKComplicationTemplateModularLargeTallBody()
            template.headerTextProvider = CLKSimpleTextProvider(text: "")
            template.bodyTextProvider = CLKSimpleTextProvider(text: "1440")
            handler(template)
        }
        else if complication.family == .circularSmall {
            let template  = CLKComplicationTemplateCircularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "1440")
            handler(template)
        }
        else if complication.family == .utilitarianSmall {
            let template  = CLKComplicationTemplateUtilitarianSmallFlat()
            template.textProvider = CLKSimpleTextProvider(text: "1440")
            handler(template)
        }
        else if complication.family == .utilitarianLarge {
            let template  = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "1440")
            handler(template)
        }
    }
    
    //func reloadTimeline(for complication: CLKComplicationServer){}
}
