# BallClockMins
# By Joseph Sturzenegger

require_relative 'BallClock'
require 'json'

class BallClockMins < BallClock
	# creates a ball clock with the number of balls and a minute count to know the time elapsed
	def initialize(ball_count, minute_count)
		super(ball_count)
		@minute_count = minute_count
	end

	# runs the clock for the number of specified minutes and prints the JSON object of the clock state
	def run_clock
		for i in (1..@minute_count)
			add_minute(@main.shift)
		end
		json_obj_hash = {:Min => @mins, :FiveMin => @five_mins, :Hour => @hours, :Main => @main}
		puts JSON.generate(json_obj_hash)
	end

end
