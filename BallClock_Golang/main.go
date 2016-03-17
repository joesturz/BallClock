package main

import "os"
import "fmt"
import "bufio"
import "strings"

func main() {

  argsCount := len(os.Args)
  argsArray := os.Args[1:]

  zero := argsArray[0]
  one := argsArray[1]

  fmt.Println("arg 0: ", zero)
  fmt.Println("arg 1: ", one)

  reader := bufio.NewReader(os.Stdin)

  for
  {
    fmt.Println("Ball Clock has two modes:")
    fmt.Println("\t1. Enter the number of balls to use in the Clock (must be 27 to 127). Will tell you how many days it takes for clock's balls to return to its starting configuration.")
    fmt.Println("\t2. Enter the number of balls (must be 27 to 127) and the number of minutes (must be greater than 0) you want the clock to run. The configuration of the balls after the give number of minutes will be printed as a JSON object.")
    fmt.Println("Enter 'exit' to exit the program:")

    text, _ := reader.ReadString('\n')
    input := strings.TrimSpace(text)

    if input == "exit" {
      break
    } else {
      if argsCount < 1 || argsCount > 2 {
        fmt.Println("You must enter no less than one argument and no more than 2 arguments!")
        break
      } else {
        fmt.Println("you entered: ",zero, one)
      }
    }
    fmt.Println("Your input was: ", input)
  }
}
