import scala.collection.JavaConverters._

/**
  * Created by joesturzenegger on 12/11/15.
  */
class BallClock(ballCount: Int) {

  var halfDayCount = 0

  //main ball array
  var mainQueue = this.createBallArray(ballCount)
  var initQueue = this.createBallArray(ballCount)


  //arrays representing the tracks
  var mins = List[Int]()
  var fiveMins = List[Int]()
  var hours = List[Int]()

  def createBallArray(count: Int) = {
    var queue = List[Int]()
    for (num <- 1 to count) {
      queue :+ num
    }
    queue
  }
  def runClock{
    do {
      addMinute(mainQueue(0))
      mainQueue.drop(0)
    }while(true != checkIfBackAtStart)
    println(ballCount + " balls cycle after " + halfDayCount/2 + " days.")
  }

  def addMinute(num: Int) {

  }
  def checkIfBackAtStart {
    val bool = true
    if (bool) {
      bool
    }
  }


}
