/**
  * Created by joesturzenegger on 12/11/15.
  */

class BallClockMins(ballCount: Int, minuteCount: Int) extends BallClock(ballCount) {

  override def runClock(){
    for (i <- 1 to minuteCount){
      addMinute(mainQueue(0))
      mainQueue = mainQueue.drop(1)
    }
    println(getJSON)
  }
  def getJSON(): String = {
    val s: String = "This is where the JSON object would be printed!"
    s
  }


}
