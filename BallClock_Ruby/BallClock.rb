# BallClock
# By Joseph Sturzenegger

class BallClock

	#creates a ball clock with the given number of balls
	def initialize(ball_count)
		@ball_count = ball_count
		@half_day_count = 0;

		@main = initize_ball_set
		@init_queue = initize_ball_set

		@mins = Array.new
		@five_mins = Array.new
		@hours = Array.new
	end

	#starts the clock
	def run_clock
		begin
			add_minute(@main.shift)
		end while !check_if_back_to_start
		message = @ball_count.to_s + " balls cycle after " + (@half_day_count / 2).to_s + " days.";
		puts message
		return message
	end

	#compares the main track to the static set to see if the clock has returned to it's initial configuration
	def check_if_back_to_start
		if @main.length != @ball_count
			return false
		end
		loop_run = @ball_count - 1
		for i in (0..loop_run)
			if @main[i] != @init_queue[i]
				return false
			end
		end
		return true
	end

	#creates the initial set of balls for both the main track and a comparison track
	def initize_ball_set
		queue = Array.new
		#loop_run = @ball_count - 1
		for ball_number in (1..@ball_count)
			queue.push(ball_number)
		end
		return queue
	end

	#adds a ball to the minutes track
	def add_minute(ball)
		if @mins.length < 4
			@mins.push(ball)
		else
			empty_mins
			add_five_minute(ball)
		end
	end

	#adds a ball to the five minutes track
	def add_five_minute(ball)
		if @five_mins.length < 11
			@five_mins.push(ball)
		else
			empty_five_mins
			add_hour(ball)
		end
	end

	#adds a ball to the hours track
	def add_hour(ball)
		if @hours.length < 11
			@hours.push(ball)
		else
			empty_hours
			@main.push(ball)
			@half_day_count = @half_day_count + 1
		end
	end

	#Empties the minutes track
	def empty_mins
		while @mins.length > 0
			@main.push(@mins.pop)
		end
	end

	#Empties the five minutes track
	def empty_five_mins
		while @five_mins.length > 0
			@main.push(@five_mins.pop)
		end
	end

	#Empties the hours track
	def empty_hours
		while @hours.length > 0
			@main.push(@hours.pop)
		end
	end

	#gets the hours track
	def get_hours
		return @hours
	end

	#gets the five minutes track
	def get_five_mins
		return @five_mins
	end

	#gets the hours track
	def get_mins
		return @mins
	end

end

