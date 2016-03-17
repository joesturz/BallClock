package main

import "os"
import "fmt"
import "bufio"
import "strings"

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
    fmt.Println("Args Array size: ", argsCount)
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
      }
    }
  }
}
