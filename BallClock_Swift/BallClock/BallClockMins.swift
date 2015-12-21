//
//  BallClockMins.swift
//  BallClock
//
//  Created by Joe Sturzenegger on 5/5/15.
//  Copyright (c) 2015 Joe Sturzenegger. All rights reserved.
//

import Foundation

class BallClockMins: BallClock
{
    var minuteCount: Int
    init(ballCount: Int, minuteCount: Int)
    {
        self.minuteCount = minuteCount
        super.init(ballCount: ballCount)
    }
    
    override func runClock()
    {
        for i in (1...minuteCount)
        {
            addMinute(mainQueue.removeAtIndex(0))
        }
        let jsonObjectHash = getJSON()
        print(jsonObjectHash)
    }
    func getJSON()->String
    {
        
        let min: String = "\"Min\":\(mins),"
        let five: String = "\"FiveMin\":\(fiveMins),"
        let hr: String = "\"Hour\":\(hours),"
        let main: String = "\"Main\":\(mainQueue)"
        
        return "{" + min + five + hr + main + "}"
    }
}