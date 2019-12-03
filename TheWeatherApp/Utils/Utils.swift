//
//  Utils.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Utils {
    
    static func convertDate(timestamp: Int) -> String {
        var strDate = "undefined"
            
             let unixTime = Double(timestamp)
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"
            dateFormatter.timeZone = TimeZone(abbreviation: timezone)
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy" 
            strDate = dateFormatter.string(from: date)
            
        return strDate
    }
    
    
    static func convertDateDay(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "EEEE"
        return  dateFormatter.string(from: date!)

    }
    
    // Screen width.
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }

    // Screen height.
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
   
}
