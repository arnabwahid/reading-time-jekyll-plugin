# Outputs the reading time

# Read this in “about 4 minutes”
# Put into your _plugins dir in your Jekyll site
# Usage: Read this in about {{ page.content | reading_time }}

module ReadingTimeFilter
	def reading_time( input )
		words_per_minute = 180.00

		words = input.split.size
		time = words / words_per_minute
		minutes = time.floor
		seconds = ((time - time.to_i) * 100).to_i
		minutes_label = minutes === 1 ? " minute" : " minutes"
		seconds_label = seconds === 1 ? " second" : " seconds"
		minutes > 0 ? "#{minutes} #{minutes_label}" + " , " + "#{seconds} #{seconds_label}" : "Less than 1 minute"
	end
end

Liquid::Template.register_filter(ReadingTimeFilter)