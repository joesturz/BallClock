package main

import (
  "os"
  "fmt"
  "bufio"
  "strings"
  "strconv"
 )


 func runBallClock(ballCount int) {
   fmt.Printf("Run the ballclock with %v balls until it resets!\n", ballCount)
   bc := new(BallClock)
   bc.init(ballCount)
   bc.runClock()

 }
 func runBallClockTime(ballCount int, mins int) {
   fmt.Printf("Run the ballclock with %v balls for %v minutes!\n",ballCount, mins)
 }

func main() {

  reader := bufio.NewReader(os.Stdin)

  for
  {
    fmt.Println("Ball Clock has two modes:")
    fmt.Println("\t1. Enter the number of balls to use in the Clock (must be 27 to 127). Will tell you how many days it takes for clock's balls to return to its starting configuration.")
    fmt.Println("\t2. Enter the number of balls (must be 27 to 127) and the number of minutes (must be greater than 0) you want the clock to run. The configuration of the balls after the give number of minutes will be printed as a JSON object.")
    fmt.Println("Enter 'exit' to exit the program:")

    text, _ := reader.ReadString('\n')
    input := strings.Split(strings.TrimSpace(text), " ")
    argsCount := len(input)
    noArgs := false
    //fmt.Println("Args Array size: ", argsCount)
    if(argsCount == 1 && input[0] == ""){
      noArgs = true
    }
    if input[0] == "exit" {
      break
    } else {
      if noArgs || argsCount > 2 {
        fmt.Println("You must enter no less than 1 argument and no more than 2 arguments!")
      } else {
        fmt.Println("you entered: ", input)
        isValid := true

        if _, err := strconv.Atoi(input[0]); err != nil {
          fmt.Printf("%v is a not a valid input\n", input[0])
          isValid = false
        }
        if argsCount == 2 {
          if _, err := strconv.Atoi(input[1]); err != nil {
            fmt.Printf("%v is a not a valid input\n", input[1])
            isValid = false
          }
        }
        if isValid {
          ballCount,_ := strconv.Atoi(input[0])
          if ballCount < 27 || ballCount > 127 {
            fmt.Printf("%v is not between 27 and 127\n", ballCount)
          } else {
            if argsCount == 1 {
             runBallClock(ballCount)
            } else {
              minCount,_ := strconv.Atoi(input[1])
              if minCount < 0 {
                fmt.Println("The minute count must be greater than 0")
              } else {
                runBallClockTime(ballCount, minCount)
              }
            }
          }
        }
      }
    }
  }
}
