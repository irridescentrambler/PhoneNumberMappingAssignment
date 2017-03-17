require 'set'

class TelephoneDictionary
	attr_accessor :telephone_number_map, :str, :isValid
	def initialize
		@telephone_number_map = {
    '2': ['a', 'b', 'c'],
    '3': ['d', 'e', 'f'],
    '4': ['g', 'h', 'i'],
    '5': ['j', 'k', 'l'],
    '6': ['m', 'n', 'o'],
    '7': ['p', 'q', 'r', 's'],
    '8': ['t', 'u', 'v'],
    '9': ['w', 'x', 'y', 'z']
		}
		@isValid = true
	end

	def get_input
		begin
			puts "Enter a 10 digit[2-9] mobile number."
			@str = gets.chomp
			if /\A[2-9]{10}\z/.match(@str)
				puts "valid"
				@isValid = false
			else
				puts "Please enter a valid number"
			end
		end while(@isValid)
	end

	def find_mathing_combination_of_digit
		# Create new array of telephone number using telephone_number_map
		new_telphone_destionary = @str.scan(/[2-9]/).map { |a| @telephone_number_map[:"#{a}"] }

		# All combination
		combination_of_digit = new_telphone_destionary.first.product(*new_telphone_destionary[1..-1]).map(&:join).to_set

		# Dictionary array
		dict_array = File.read('dictionary.txt').downcase.split("\n").to_set

		# Find out output according to assignment
		result = []
		combination_of_digit.each do |com_of_digit|
		  5.times do |i|
	      if (dict_array.include? com_of_digit[0..i+2]) && (dict_array.include? com_of_digit[i+3..9])
	          result << [com_of_digit[0..i+2],com_of_digit[i+3..9]]
	      end
		  end
		end
		(combination_of_digit & dict_array).to_a.each { |matching_array| result << matching_array }
		result.to_a.compact
	end

end	
