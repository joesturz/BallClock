//
//  BallClock.swift
//  BallClock
//
//  Created by Joe Sturzenegger on 5/4/15.
//  Copyright (c) 2015 Joe Sturzenegger. All rights reserved.
//

import Foundation

class BallClock
{
    var ballCount: Int
    var halfDayCount: Int
    
    //main ball array
    var mainQueue: Array<Int>
    
    var initQueue: Array<Int>
    
    //arrays representing the tracks
    var mins: Array<Int>
    var fiveMins: Array<Int>
    var hours: Array<Int>
    
    init(ballCount: Int)
    {
        self.ballCount = ballCount
        halfDayCount = 0
        
        mainQueue = BallClock.createBallArray(ballCount: ballCount)
        initQueue = BallClock.createBallArray(ballCount: ballCount)
        
        mins = [Int]()
        fiveMins = [Int]()
        hours = [Int]()
    }
    
    class func createBallArray(ballCount ballCount:Int)->Array<Int>
    {
        var queue: Array<Int> = [Int]()
        for num in 1...ballCount
        {
            queue.append(num)
        }
        return queue
    }
    
    func runClock()
    {
        repeat
        {
            addMinute(mainQueue.removeAtIndex(0))
        }while !checkIfBackToStart()
        print("\(ballCount) balls cycle after \(Double(halfDayCount)/2) days.")
    }
    func checkIfBackToStart()->Bool
    {
        if mainQueue.count != initQueue.count
        {
            return false
        }
        for ballNum in 0..<ballCount
        {
            if(mainQueue[ballNum] != initQueue[ballNum])
            {
                return false
            }
        }
        return true
    }
    
    func addMinute(ball: Int)
    {
        if mins.count < 4
        {
            mins.append(ball)
        }
        else
        {
            emptyMins()
            addFiveMinute(ball)
        }
    }
    
    func addFiveMinute(ball: Int)
    {
        if fiveMins.count < 11
        {
            fiveMins.append(ball)
        }
        else
        {
            emptyFiveMins()
            addHour(ball)
        }
    }
    
    func addHour(ball: Int)
    {
        if hours.count < 11
        {
            hours.append(ball)
        }
        else
        {
            emptyHours()
            mainQueue.append(ball)
            halfDayCount++;
        }
    }
    func emptyMins()
    {
        
        while mins.count > 0
        {
            mainQueue.append(mins.removeLast())
        }
    }
    
    func emptyFiveMins()
    {
        while fiveMins.count > 0
        {
            mainQueue.append(fiveMins.removeLast())
        }
    }
    
    func emptyHours()
    {
        while hours.count > 0
        {
            mainQueue.append(hours.removeLast())
        }
    }
    
}

