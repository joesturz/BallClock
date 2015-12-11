# StartBallClock
# By Joseph Sturzenegger
require_relative 'BallClock'
require_relative 'BallClockMins'

while(true)
	puts "Ball Clock has two modes:"
	puts "\t1. Enter the number of balls to use in the Clock (must be 27 to 127). Will tell you how many days it takes for clock's balls to return to its starting configuration."
	puts "\t2. Enter the number of balls (must be 27 to 127) and the number of minutes (must be greater than 0) you want the clock to run. The configuration of the balls after the give number of minutes will be printed as a JSON object."
	puts "Enter 'exit' to exit the program:"
	
	input = gets.chomp
	if(input == 'exit')
		break
	else
		args = input.split
		# make sure that no less than 1 and no more than 2 arguments are supplied
		if(args.length < 1 || args.length > 2)
			puts 'You must enter no less than one argument and no more than 2 arguments!'
			break
		else
			is_valid = true
			args.each do |arg|
				# check for positive integers
				if !/\A\d+\z/.match(arg)
      				puts arg + ' is not a valid input'
      				is_valid = false
  				end
			end
			if(is_valid)
				ball_count = args[0].to_i
				# make sure that the number of balls is correct
				if ((ball_count < 27) || (ball_count > 127))
					puts ball_count.to_s + " is not between 27 and 127."
				else
					if(args.length == 1)
						BallClock.new(ball_count).run_clock
					else
						min_count = args[1].to_i
						if(min_count < 0)
							puts "The minute value must be 0 or greater."
						else
							BallClockMins.new(ball_count, min_count).run_clock
						end
					end
				end
			end
		end
	end
end