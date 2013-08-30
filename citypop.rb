require 'rubygems'
require 'sinatra'

require 'nokogiri'
require 'open-uri'

get '/' do
	PAGE_URL = 'http://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS'

	page = Nokogiri::HTML(open(PAGE_URL))
	@stats = page.css('table.views-table tbody tr')
 	erb :citypop
end

# @stats.each do |nation|
# 	@country = nation.css('.views-field-country-value').text.strip
# 	@percent = nation.css('.wbapi-data-value-last').text.strip.to_i
# 	if @percent.between?(1, 9)
# 		@icons = " "
# 	elsif @percent.between?(10, 19)
# 		@icons = "*"
# 	elsif @percent.between?(20, 29)
# 		@icons = "**"
# 	elsif @percent.between?(30, 39)
# 		@icons = "***"
# 	elsif @percent.between?(40, 49)
# 		@icons = "****"
# 	elsif @percent.between?(50, 59)
# 		@icons = "*****"
# 	elsif @percent.between?(60, 69)
# 		@icons = "******"
# 	elsif @percent.between?(70, 79)
# 		@icons = "*******"
# 	elsif @percent.between?(80, 89)
# 		@icons = "********"
# 	elsif @percent.between?(90, 100)
# 		@icons = "*********"
# 	else puts 
# 		"Did not report this year"
# 	end
# 	puts "#{@country}: #{@percent}%  #{@icons}"
# end

# For the ones who didn't report: drop? put in "did not report for this year"? 