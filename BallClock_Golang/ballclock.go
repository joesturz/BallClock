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

func runClock() {

}

func checkIfBackToStart() bool {

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
