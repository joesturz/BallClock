import "fmt"

type ballclock struct {
  ballCount int
  halfDayCount int
  mainQueue []int
  initQueue []int

  mins []int
  fiveMins []int
  hours []int
}

func (clock *ballclock) init(ballCount int) {
  clock.ballCount = ballCount
  clock.halfDayCount = 0

  clock.mainQueue = createSlice(ballCount)
  clock.initQueue = createSlice(ballCount)

}

func createSlice(sliceSize int) []int {
  slice []int
  for i := 1; i < sliceSize+1; i++ {
    slice = append(slice, i)
  }
  return slice
}

func (clock *ballclock) runClock() {
  fmt.Printf("%v balls cycle after %v days.",clock.ballCount, clock.halfDayCount*2)
}

func (clock *ballclock) checkIfBackToStart() bool {
  if len(clock.mainQueue) != len(clock.initQueue) {
    return false
  }
  for ballnum := 0; ballnum <= clock.ballCount; ballnum++ {
    if clock.mainQueue[ballnum] != clock.initQueue[ballnum] {
      return false
    }
  }
  return true
}

func addMinute(ball int) {

}

func addFiveMinute(ball int) {

}

func addHour(ball int) {

}

func emptyMins() {

}

func emptyFiveMins() {

}

func emptyHours() {

}
