//
//  main.swift
//  BallClock
//
//  Created by Joe Sturzenegger on 4/29/15.
//  Copyright (c) 2015 Joe Sturzenegger. All rights reserved.
//

import Foundation

while(true)
{
    print("Ball Clock has two modes:")
    print("\t1. Enter the number of balls to use in the Clock (must be 27 to 127). Will tell you how many days it takes for clock's balls to return to its starting configuration.")
    print("\t2. Enter the number of balls (must be 27 to 127) and the number of minutes (must be greater than 0) you want the clock to run. The configuration of the balls after the give number of minutes will be printed as a JSON object.")
    print("Enter 'exit' to exit the program:")
    
    //clean the input data of white space
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let input = NSString(data: inputData, encoding: NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

    if input == "exit"
    {
        break
    }
    else
    {
        let args = input.characters.split{$0 == " "}.map { String($0) }
        if args.count < 1 || args.count > 2
        {
            print("You must enter no less than 1 argument and no more than 2 arguments!")
        }
        else
        {
            var isValid = true;
            for arg in args
            {
                let tempArg = Int(arg)
                if tempArg == nil || tempArg < 1
                {
                    print(arg + " is not a valid input")
                    isValid = false
                }
            }
            if isValid
            {
                let ballCount = Int(args[0])!
                if ballCount < 27 || ballCount > 127
                {
                    print(args[0] + " is not between 27 and 127")
                }
                else
                {
                    if args.count == 1
                    {
                        let ballClock = BallClock(ballCount: ballCount)
                        ballClock.runClock();
                    }
                    else
                    {
                        let minCount = Int(args[1])!
                        if minCount < 0
                        {
                            print("The minute count must be greater than 0")
                        }
                        else
                        {
                            let ballClock = BallClockMins(ballCount: ballCount, minuteCount: minCount)
                            ballClock.runClock()
                        }
                    }
                }
            }
        }
    }
}

