import util.control.Breaks._

object BallClockMain {
  def main(argv: Array[String]){
    while (true) {
      println("Ball Clock has two modes:")
      println("\t1. Enter the number of balls to use in the Clock (must be 27 to 127). Will tell you how many days it takes for clock's balls to return to its starting configuration.")
      println("\t2. Enter the number of balls (must be 27 to 127) and the number of minutes (must be greater than 0) you want the clock to run. The configuration of the balls after the give number of minutes will be printed as a JSON object.")
      println("Enter 'exit' to exit the program:")
      //read in data from the console and put set input with that String
      for (inputString <- io.Source.stdin.getLines) {
        val input = inputString
        if (input == "exit") {
          break
        }
        else {
          val args = input.split(" ").toList
          if (args.size < 1 || args.size > 2) {
            println("You must enter no less than 1 argument and no more than 2 arguments!")
          }
          else {
            var isValid = true

            for (arg <- args) {
              val tempArg = toInt(arg)
              if (tempArg == null || tempArg < 1) {
                println(arg + " is not a valid input")
                isValid = false
              }
            }
            if (isValid) {
              val ballCount = toInt(args(0))

              if (ballCount < 27 || ballCount > 127) {
                println(args(0) + " is not between 27 and 127")
              }
              else {
                // create and run an actual BallClock
                if (args.size == 1) {
                  val ballClock = new BallClock(ballCount)
                  ballClock.runClock
                }
                else {
                  val minCount = toInt(args(1))
                  if (minCount < 1) {
                    println("The minute count must be greater than 0")
                  }
                  else {
                    val ballClock = new BallClockMins(ballCount, minCount)
                    ballClock.runClock()
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  def toInt(s: String): Int = {
    try {
      s.toInt
    } catch {
      case e: Exception => 0
    }
  }
}