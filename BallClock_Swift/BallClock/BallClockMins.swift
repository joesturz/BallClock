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
        var jsonObjectHash = getJSON()
        println(jsonObjectHash)
    }
    func getJSON()->String
    {
        
        var min: String = "\"Min\":\(mins),"
        var five: String = "\"FiveMin\":\(fiveMins),"
        var hr: String = "\"Hour\":\(hours),"
        var main: String = "\"Main\":\(mainQueue)"
        
        return "{" + min + five + hr + main + "}"
    }
}