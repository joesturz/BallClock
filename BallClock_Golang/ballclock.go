package main
import "fmt"

type BallClock struct {
  ballCount int
  halfDayCount int
  mainQueue []int
  initQueue []int

  mins []int
  fiveMins []int
  hours []int
}

func (clock *BallClock) init(ballCount int) {
  clock.ballCount = ballCount
  clock.halfDayCount = 0

  clock.mainQueue = createSlice(ballCount)
  clock.initQueue = createSlice(ballCount)

  clock.mins = make([]int, 0)
  clock.fiveMins = make([]int, 0)
  clock.hours = make([]int, 0)
}

func createSlice(sliceSize int) []int {
  slice := make([]int, 0)
  for i := 1; i < sliceSize+1; i++ {
    slice = append(slice, i)
  }
  return slice
}
//used for debugging
func (clock *BallClock)prtev(counter int) {
  fmt.Println("counter: ", counter)
  fmt.Println("mins: ",clock.mins)
  fmt.Println("five: ",clock.fiveMins)
  fmt.Println("hours: ",clock.hours)
  fmt.Println("main: ",clock.mainQueue)
  fmt.Println("init: ",clock.initQueue)
}

func (clock *BallClock) runClock() {
  counter := 0
  clock.addMinute(clock.mainQueue[0])
  clock.mainQueue = clock.mainQueue[1:]
  counter = counter + 1
  for !clock.checkIfBackToStart() {
    clock.addMinute(clock.mainQueue[0])
    clock.mainQueue = clock.mainQueue[1:]
    counter = counter + 1
  }
  fmt.Printf("%v balls cycle after %v days.\n",clock.ballCount, clock.halfDayCount/2)
}

func (clock *BallClock) checkIfBackToStart() bool {
  if len(clock.mainQueue) != len(clock.initQueue) {
    //fmt.Println("false on length")
    return false
  }
  for ballnum := 0; ballnum < clock.ballCount; ballnum++ {
    if clock.mainQueue[ballnum] != clock.initQueue[ballnum] {
      //fmt.Println("false on comparison")
      return false
    }
  }
  //fmt.Println("true on comparison")
  return true
}

func (clock *BallClock) addMinute(ball int) {
  //fmt.Println("addMin", ball)
  if len(clock.mins) < 4 {
    clock.mins = append(clock.mins, ball)
  } else {
    clock.emptyMins()
    clock.addFiveMinute(ball)
  }
}

func (clock *BallClock) addFiveMinute(ball int) {
  //fmt.Println("addFiveMin", ball)
  if len(clock.fiveMins) < 11 {
    clock.fiveMins = append(clock.fiveMins, ball)
  } else {
    clock.emptyFiveMins()
    clock.addHour(ball)
  }
}

func (clock *BallClock) addHour(ball int) {
  //fmt.Println("addHour", ball)
  if len(clock.hours) < 11 {
    clock.hours = append(clock.hours, ball)
  } else {
    clock.emptyHours()
    clock.mainQueue = append(clock.mainQueue, ball)
    clock.halfDayCount++
  }
}

func (clock *BallClock) emptyMins() {
  for(len(clock.mins) > 0){
    clock.mainQueue = append(clock.mainQueue, clock.mins[len(clock.mins) - 1])
    clock.mins = clock.mins[:len(clock.mins) - 1]
  }
}

func (clock *BallClock) emptyFiveMins() {
  for(len(clock.fiveMins) > 0){
    clock.mainQueue = append(clock.mainQueue, clock.fiveMins[len(clock.fiveMins) - 1])
    clock.fiveMins = clock.fiveMins[:len(clock.fiveMins) - 1]
  }
}

func (clock *BallClock) emptyHours() {
  for(len(clock.hours) > 0){
    clock.mainQueue = append(clock.mainQueue, clock.hours[len(clock.hours) - 1])
    clock.hours = clock.hours[:len(clock.hours) - 1]
  }
}
