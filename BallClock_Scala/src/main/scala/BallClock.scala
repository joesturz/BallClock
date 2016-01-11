import scala.collection.JavaConverters._
import scala.collection.mutable

/**
  * Created by joesturzenegger on 12/11/15.
  */
class BallClock(ballCount: Int) {

  var halfDayCount = 0

  //main ball array
  var mainQueue = createBallList(ballCount)
  var initQueue = createBallList(ballCount)


  //arrays representing the tracks
  var mins = List[Int]()
  var fiveMins = List[Int]()
  var hours = List[Int]()



  def createBallList(count: Int): List[Int] = {
    var queue = List[Int]()
    for (num <- 1 to count) {
      queue = queue :+ num
    }
    queue
  }
  def runClock{
    do {
      addMinute(mainQueue(0))
      mainQueue = mainQueue.drop(1)
    }while(true != checkIfBackAtStart)
    println(ballCount + " balls cycle after " + halfDayCount/2 + " days.")
  }

  def addMinute(ball: Int): Unit = {
    if (mins.length < 4){
      mins = mins :+ ball
    }
    else {
      emptyMins
      addFiveMinute(ball)
    }
  }

  def addFiveMinute(ball: Int): Unit = {
    if (fiveMins.length < 11){
      fiveMins = fiveMins :+ ball
    }
    else {
      emptyFiveMins
      addHour(ball)
    }
  }

  def addHour(ball: Int): Unit = {
    if (hours.length < 11){
      hours = hours :+ ball
    }
    else {
      emptyHours
      mainQueue = mainQueue :+ ball
      halfDayCount += 1;
    }
  }

  def emptyMins: Unit = {
    while(mins.length > 0) {
      mainQueue = mainQueue :+ mins.last
      mins = mins.dropRight(1)
    }
  }

  def emptyFiveMins: Unit = {
    while(fiveMins.length > 0) {
      mainQueue = mainQueue :+ fiveMins.last
      fiveMins = fiveMins.dropRight(1)
    }
  }

  def emptyHours: Unit = {
    while(hours.length > 0) {
      mainQueue = mainQueue :+ hours.last
      hours = hours.dropRight(1)
    }
  }

  def checkIfBackAtStart: Boolean = {
    if(mainQueue.size != initQueue.size) {
      return false
    }
    for(ballNum <- 0 until (ballCount-1)){
      if(mainQueue(ballNum) != initQueue(ballNum)){
        return false
      }
    }
    return true
  }
}
