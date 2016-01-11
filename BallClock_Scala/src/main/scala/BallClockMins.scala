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
    val m = getString(mins)
    val f = getString(fiveMins)
    val h = getString(hours)
    val mq = getString(mainQueue)
    val s: String = "{" + "\"Min\": "+ m +"," + "\"FiveMin\": "+ f +"," +"\"Hour\": "+ h +"," +"\"Main\": " + mq + "}"
    s
  }
  def getString(a: List[Int]): String ={
    val s = a.mkString("[",",","]")
    s
  }


}
