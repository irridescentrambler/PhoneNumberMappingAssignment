require_relative "spec_helper.rb"
require_relative "../telephone_dictionary.rb"

RSpec.describe do
	describe "Tests the TelephoneDictionary class" do
		before(:all) do
			@telephone_dictionary = TelephoneDictionary.new
		end	

		it "Tests the initialize method" do
			expect(@telephone_dictionary).to_not be_nil
		end

		it "Tests the instance variables" do
			expect(@telephone_dictionary.instance_variable_get(:@telephone_number_map)).to_not be_nil
			expect(@telephone_dictionary.instance_variable_get(:@isValid)).to_not be_nil
		end

		it "Tests the #find_mathing_combination_of_digit method" do
			@telephone_dictionary.instance_variable_set(:@str, "6686787825")
			expect(@telephone_dictionary.find_matching_combination_of_digit).to eq([["motor", "truck"], ["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"])
		end	
	end
end

